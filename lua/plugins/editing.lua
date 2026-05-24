-- Editing power tools

return {
	-- auto-close brackets, parens, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},

	-- line and block commenting
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- surround selections with brackets, quotes, tags, etc.
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		opts = {},
	},

	-- multi-cursor editing
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = { "smoka7/hydra.nvim" },
		cmd = { "MCstart", "MCvisual", "MCpattern", "MCunderCursor" },
		keys = {
			{ "<leader>m", "<cmd>MCstart<cr>", mode = { "n", "v" }, desc = "Multi Cursor" },
		},
	},
}
