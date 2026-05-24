-- blink.cmp: LSP-powered completion

return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = { preset = "default" },
		sources = {
			default = { "lsp", "path", "buffer" },
		},
	},
}
