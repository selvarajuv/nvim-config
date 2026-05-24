-- Shared tmux/nvim split navigation functions.
-- Used by terminal.lua (global keymaps) and explorer.lua (oil keymaps override)
-- so the same logic works in every buffer type.

local M = {}

function M.left()
	if vim.fn.winnr() == vim.fn.winnr("h") then
		vim.fn.system("tmux if -F '#{pane_at_left}' '' 'select-pane -L'")
	else
		vim.cmd("wincmd h")
	end
end

function M.down()
	if vim.fn.winnr() == vim.fn.winnr("j") then
		vim.fn.system("tmux if -F '#{pane_at_bottom}' '' 'select-pane -D'")
	else
		vim.cmd("wincmd j")
	end
end

function M.up()
	if vim.fn.winnr() == vim.fn.winnr("k") then
		vim.fn.system("tmux if -F '#{pane_at_top}' '' 'select-pane -U'")
	else
		vim.cmd("wincmd k")
	end
end

function M.right()
	if vim.fn.winnr() == vim.fn.winnr("l") then
		vim.fn.system("tmux if -F '#{pane_at_right}' '' 'select-pane -R'")
	else
		vim.cmd("wincmd l")
	end
end

return M
