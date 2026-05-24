-- Git utilities: conflict markers and inline blame
-- git-blame is disabled by default; toggle with <leader>gB

return {
	{
		"akinsho/git-conflict.nvim",
		event = "BufReadPost",
		opts = {},
	},

	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
		opts = {
			enabled = false,
		},
		keys = {
			{ "<leader>gB", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
		},
	},
}
