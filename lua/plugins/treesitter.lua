-- nvim-treesitter: syntax parsing for accurate highlighting and indentation
-- Pinned to `master` branch — the `main` branch is the 0.10+ rewrite with a
-- different API (no setup(), no ensure_installed/highlight/indent options).

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"python",
				"typescript",
				"javascript",
				"go",
				"rust",
				"lua",
				"markdown",
				"markdown_inline",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- render-markdown.nvim: rich markdown rendering directly in the buffer
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
		ft = { "markdown" },
		opts = {},
	},
}
