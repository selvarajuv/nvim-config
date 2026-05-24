-- venv-selector.nvim: pick Python virtual environment per project

return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	-- only load when opening a Python file
	ft = "python",
	opts = {
		options = {
			-- don't let venv-selector hijack vim.notify (Noice owns it)
			override_notify = false,
		},
		search = {
			-- conda is installed at /opt/miniconda3 (not ~/miniconda3)
			miniconda_base = {
				command = "fd '/python$' /opt/miniconda3/bin --full-path --color never",
				type = "anaconda",
			},
			miniconda_envs = {
				command = "fd 'bin/python$' /opt/miniconda3/envs --no-ignore-vcs --full-path --color never",
				type = "anaconda",
			},
		},
	},
	keys = {
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Venv" },
	},
}
