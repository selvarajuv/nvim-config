-- trouble.nvim: pretty diagnostics, quickfix, and location list panel

return {
	"folke/trouble.nvim",
	-- lazy-load: only triggered when :Trouble is called or a keymap fires
	cmd = "Trouble",
	opts = {},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
		{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
		{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
	},
}
