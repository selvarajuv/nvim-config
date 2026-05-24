-- General vim options

-- disable netrw (replaced by oil.nvim)
-- must be set before plugins load
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

-- numbers
opt.number = true

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- ui
opt.wrap = true
opt.linebreak = true -- wrap at word boundaries instead of mid-word
opt.breakindent = true -- preserve indentation on wrapped lines
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.cursorline = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- splits
opt.splitbelow = true
opt.splitright = true

-- misc
opt.termguicolors = true
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.shortmess:append("A") -- silence swapfile/W325 warnings

-- ──────────────────────────────────────────────────────────────────────────
-- Live reload of files edited externally (e.g. pi in another tmux pane).
-- Uses libuv fs_event watchers (kernel FSEvents on macOS) — event-driven,
-- zero CPU when idle, fires regardless of nvim pane focus.
-- ──────────────────────────────────────────────────────────────────────────
opt.autoread = true

local watchers = {} -- bufnr -> uv_fs_event_t

local function stop_watcher(bufnr)
  local w = watchers[bufnr]
  if w then
    pcall(function() w:stop() end)
    pcall(function() w:close() end)
    watchers[bufnr] = nil
  end
end

local function start_watcher(bufnr)
  if watchers[bufnr] then return end
  if not vim.api.nvim_buf_is_valid(bufnr) then return end
  if vim.bo[bufnr].buftype ~= "" then return end -- skip terminals, help, etc.
  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == "" or vim.fn.filereadable(path) == 0 then return end

  local w = vim.uv.new_fs_event()
  if not w then return end
  watchers[bufnr] = w
  w:start(path, {}, vim.schedule_wrap(function(err)
    if err or not vim.api.nvim_buf_is_valid(bufnr) then
      stop_watcher(bufnr)
      return
    end
    vim.api.nvim_buf_call(bufnr, function()
      vim.cmd("silent! checktime")
    end)
    -- Some editors replace files via rename; re-arm watcher on the new inode.
    stop_watcher(bufnr)
    vim.defer_fn(function() start_watcher(bufnr) end, 50)
  end))
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePost" }, {
  pattern = "*",
  callback = function(args) start_watcher(args.buf) end,
})
vim.api.nvim_create_autocmd({ "BufDelete", "BufWipeout" }, {
  pattern = "*",
  callback = function(args) stop_watcher(args.buf) end,
})
-- Belt-and-suspenders: still checktime on focus/buffer entry (cheap).
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "silent! checktime",
})
vim.api.nvim_create_autocmd("FileChangedShellPost", {
  pattern = "*",
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
  end,
})
