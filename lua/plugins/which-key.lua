-- which-key.nvim: keymap popup and leader group labels

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "g", group = "goto" },
			{ "<leader>a", group = "ai" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>c", group = "code" },
			{ "<leader>x", group = "diagnostics" },
			{ "<leader>d", group = "debug" },
			{ "<leader>t", group = "test" },
			{ "<leader>T", group = "terminal" },
			{ "<leader>v", group = "venv" },
			{ "<leader>n", group = "noice" },
		},
	},
}
