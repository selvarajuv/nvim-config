-- conform.nvim: auto-formatting on save

return {
	"stevearc/conform.nvim",
	-- load just before saving
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			python = { "ruff_format" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			lua = { "stylua" },
			go = { "gofmt" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			desc = "Format Buffer",
		},
	},
}
