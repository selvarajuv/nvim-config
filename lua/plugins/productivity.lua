-- Productivity extras

return {
	-- styled ASCII comment boxes and lines
	{
		"LudoPinelli/comment-box.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>cb", "<cmd>CBccbox<cr>", desc = "Comment Box" },
		},
	},

	-- insert and remove log statements fast
	{
		"chrisgrieser/nvim-chainsaw",
		event = "VeryLazy",
		keys = {
			{
				"<leader>cl",
				function()
					require("chainsaw").variableLog()
				end,
				desc = "Log Variable",
			},
			{
				"<leader>cR",
				function()
					require("chainsaw").removeLogs()
				end,
				desc = "Remove Logs",
			},
		},
	},

	-- generate docstrings for functions and classes
	{
		"danymat/neogen",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>cn",
				function()
					require("neogen").generate()
				end,
				desc = "Generate Docstring",
			},
		},
	},
}
