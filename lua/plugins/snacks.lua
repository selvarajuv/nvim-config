-- snacks.nvim: collection of small quality-of-life utilities

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = { enabled = true },
		notifier = { enabled = false }, -- let Noice handle vim.notify
		-- disables heavy features (treesitter, LSP) when opening large files
		bigfile = { enabled = true },
		bufdelete = { enabled = true },
		-- highlights all occurrences of the word under the cursor
		words = { enabled = true },
		-- replaces vim.ui.input with a nicer floating prompt (used by LSP rename, etc.)
		input = { enabled = true },
		lazygit = { enabled = true },
	},
	keys = {
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "LazyGit",
		},
		{
			"<leader>bd",
			function()
				Snacks.bufdelete()
			end,
			desc = "Delete Buffer",
		},
	},
}
