-- nvim-treesitter: syntax parsing for accurate highlighting and indentation
-- Uses the `main` branch — the full rewrite required by Neovim 0.12+.
-- The old `master` branch is frozen and does NOT support Neovim 0.12, which
-- caused the treesitter highlighter to crash (`attempt to call method 'range'`).
--
-- The `main` branch has a different API: no configs.setup() with
-- highlight/indent/ensure_installed. Instead:
--   * parsers are installed via require("nvim-treesitter").install{...}
--   * highlighting is Neovim-native, enabled with vim.treesitter.start()
--   * indentation is enabled via the buffer-local 'indentexpr'
-- The plugin does not support lazy-loading, hence `lazy = false`.

-- Parsers we want installed (parser names; markdown_inline is injected by markdown)
local ensure_installed = {
	"python",
	"typescript",
	"javascript",
	"go",
	"rust",
	"lua",
	"markdown",
	"markdown_inline",
}

-- Filetypes for which we enable treesitter highlight + indent. markdown_inline
-- has no standalone filetype (it's injected inside markdown), so it's omitted.
local filetypes = {
	"python",
	"typescript",
	"javascript",
	"go",
	"rust",
	"lua",
	"markdown",
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = filetypes,
				callback = function()
					-- Highlighting (Neovim-native). pcall guards the first run
					-- before parsers have finished installing.
					pcall(vim.treesitter.start)
					-- Indentation (experimental, provided by this plugin).
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
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
