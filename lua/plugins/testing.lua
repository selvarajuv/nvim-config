-- Test runner and coverage

return {
	-- neotest: unified test runner
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-python",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-python")({
						runner = "pytest",
						dap = { justMyCode = false },
					}),
				},
			}
		end,
		keys = {
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run Nearest",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run File",
			},
			{
				"<leader>ts",
				function()
					require("neotest").summary.toggle()
				end,
				desc = "Summary",
			},
			{
				"<leader>to",
				function()
					require("neotest").output.open({ enter = true })
				end,
				desc = "Output",
			},
		},
	},

	-- nvim-coverage: show test coverage as gutter signs
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- reload coverage data whenever it changes on disk
			auto_reload = true,
		},
		keys = {
			{
				"<leader>tc",
				function()
					require("coverage").toggle()
				end,
				desc = "Toggle Coverage",
			},
		},
	},
}
