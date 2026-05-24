-- Global keymaps
-- Plugin-specific keymaps live in their respective plugin files (lua/plugins/)
-- Add keymaps here that are not tied to any specific plugin

vim.g.mapleader = " "

-- move visual selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- join line below without moving the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- half-page up and down, keeping cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- search results stay centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- re-indent paragraph without moving the cursor
vim.keymap.set("n", "=ap", "ma=ap'a")

-- clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Seamless navigation between nvim splits and tmux panes.
-- Each handler checks whether the current nvim window is already at the
-- edge in that direction. If it is, the move is passed through to tmux;
-- otherwise nvim handles it as a normal split navigation.
-- oil.nvim overrides these with its own buffer-local maps that call the
-- same `util.nav` functions — see plugins/explorer.lua.
local nav = require("util.nav")
vim.keymap.set("n", "<C-h>", nav.left,  { desc = "Navigate Left" })
vim.keymap.set("n", "<C-j>", nav.down,  { desc = "Navigate Down" })
vim.keymap.set("n", "<C-k>", nav.up,    { desc = "Navigate Up" })
vim.keymap.set("n", "<C-l>", nav.right, { desc = "Navigate Right" })
