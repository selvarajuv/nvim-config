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
		-- Set up LSP keymaps when a server attaches to a buffer.
		-- These are buffer-local so they only exist where an LSP is active.
		-- desc fields make them show up (labeled) in which-key.
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local buf = args.buf
				local function map(keys, fn, desc)
					vim.keymap.set("n", keys, fn, { buffer = buf, desc = "LSP: " .. desc })
				end

				map("gd", vim.lsp.buf.definition, "Goto Definition")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")
				map("gi", vim.lsp.buf.implementation, "Goto Implementation")
				map("gy", vim.lsp.buf.type_definition, "Goto Type Definition")
				map("gr", vim.lsp.buf.references, "References")
				map("K", vim.lsp.buf.hover, "Hover Docs")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("<leader>cr", vim.lsp.buf.rename, "Rename Symbol")
				map("<leader>cs", vim.lsp.buf.signature_help, "Signature Help")
			end,
		})

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
