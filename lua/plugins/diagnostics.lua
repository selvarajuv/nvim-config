-- Diagnostic display enhancements

return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "LspAttach",
		config = function()
			-- disable built-in virtual text; tiny-inline-diagnostic renders its own
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup()
		end,
	},

	{
		"kosayoda/nvim-lightbulb",
		event = "LspAttach",
		opts = {
			autocmd = { enabled = true },
		},
	},
}
