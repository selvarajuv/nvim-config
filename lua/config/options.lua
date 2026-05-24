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
opt.wrap = false
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
