-- LSP (Language Server Protocol) setup
--
-- Single source of truth: the `servers` list below feeds both
--   - mason-lspconfig's `ensure_installed` (auto-install via Mason)
--   - vim.lsp.enable (actually start the servers)
-- `automatic_enable = false` stops mason-lspconfig from also calling
-- vim.lsp.enable behind our back (it would race with our per-server
-- vim.lsp.config calls below).

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local servers = { "pyright", "ts_ls", "lua_ls" }

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = false,
		})

		-- Default config applied to every server: extend Neovim's built-in
		-- LSP client capabilities with blink.cmp's (snippets, resolve, etc.)
		vim.lsp.config("*", {
			capabilities = require("blink.cmp").get_lsp_capabilities({}, true),
		})

		-- Tell lua_ls it's running inside a Neovim config
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					-- Neovim uses LuaJIT, not standard Lua
					runtime = { version = "LuaJIT" },
					workspace = {
						checkThirdParty = false,
						-- expose the full nvim runtime and installed plugins to lua_ls
						library = vim.api.nvim_get_runtime_file("", true),
					},
					-- prevent lua_ls from flagging vim as an unknown global
					diagnostics = { globals = { "vim" } },
					telemetry = { enable = false },
				},
			},
		})

		vim.lsp.enable(servers)
	end,
}
