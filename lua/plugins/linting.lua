-- nvim-lint: async linting via external linters

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
			typescript = { "eslint_d" },
			javascript = { "eslint_d" },
		}

		-- lint after saving and after leaving insert mode
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
