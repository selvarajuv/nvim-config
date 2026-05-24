-- blink.cmp: LSP-powered completion

return {
	"saghen/blink.cmp",
	version = "*",
	opts = {
		keymap = { preset = "super-tab" },
		sources = {
			default = { "lsp", "path", "buffer" },
		},
	},
}
