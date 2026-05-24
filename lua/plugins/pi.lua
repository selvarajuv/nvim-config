-- pi.nvim — invoke the pi coding agent from inside nvim for small edits.
-- For larger sessions / chat, run `pi` in a dedicated tmux pane instead.
-- The fs_event watchers in config/options.lua will auto-reload buffers
-- when pi writes files (from either source).
return {
  "pablopunk/pi.nvim",
  cmd = { "PiAsk", "PiAskSelection", "PiCancel", "PiLog" },
  keys = {
    { "<leader>ai", ":PiAsk<CR>", mode = "n", desc = "Ask pi (buffer context)" },
    { "<leader>ai", ":PiAskSelection<CR>", mode = "v", desc = "Ask pi (selection)" },
    { "<leader>ax", ":PiCancel<CR>", mode = "n", desc = "Cancel pi request" },
    { "<leader>al", ":PiLog<CR>", mode = "n", desc = "Open pi session log" },
  },
  opts = {
    -- provider/model omitted → pi uses its own configured default
    thinking = "off", -- snappy responses; bump to "low"/"medium" for harder problems
    context = {
      max_bytes = 24000,
      diagnostics = {
        enabled = true, -- send LSP/linter diagnostics so pi sees errors
      },
    },
    skills = true,
    extensions = true,
  },
  config = function(_, opts)
    require("pi").setup(opts)
  end,
}
