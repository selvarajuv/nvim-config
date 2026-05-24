-- File explorer: oil.nvim
-- Create: type a new filename on a new line, :w
-- Delete: delete the line (dd), :w
-- Rename/Move: edit the line text, :w

return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		view_options = {
			show_hidden = true,
		},
		-- Override oil's default <C-h>/<C-l> (split-select / refresh) so that
		-- tmux-style pane navigation works from inside an oil buffer.
		-- <C-j>/<C-k> aren't oil defaults but we set them here too so the
		-- behavior is consistent regardless of lazy-load order.
		keymaps = {
			["<C-h>"] = {
				callback = function()
					require("util.nav").left()
				end,
				desc = "Navigate Left (tmux)",
				mode = "n",
			},
			["<C-j>"] = {
				callback = function()
					require("util.nav").down()
				end,
				desc = "Navigate Down (tmux)",
				mode = "n",
			},
			["<C-k>"] = {
				callback = function()
					require("util.nav").up()
				end,
				desc = "Navigate Up (tmux)",
				mode = "n",
			},
			["<C-l>"] = {
				callback = function()
					require("util.nav").right()
				end,
				desc = "Navigate Right (tmux)",
				mode = "n",
			},
		},
	},
	keys = {
		{
			"<leader>pv",
			function()
				require("oil").open()
			end,
			desc = "Open File Explorer",
		},
		{
			"-",
			function()
				require("oil").open()
			end,
			desc = "Open File Explorer",
		},
	},
}
