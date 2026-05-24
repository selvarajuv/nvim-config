-- which-key.nvim: keymap popup and leader group labels

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>x", group = "diagnostics" },
			{ "<leader>d", group = "debug" },
			{ "<leader>t", group = "test" },
			{ "<leader>v", group = "venv" },
			{ "<leader>n", group = "noice" },
		},
	},
}
