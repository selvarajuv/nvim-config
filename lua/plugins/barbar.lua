-- barbar.nvim: buffer tab bar

return {
	"romgrk/barbar.nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = {
		-- no sliding animations
		animation = false,
	},
	keys = {
		{ "<S-h>", "<cmd>BufferPrevious<cr>", desc = "Previous Buffer" },
		{ "<S-l>", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
	},
}
