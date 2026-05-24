-- toggleterm.nvim: persistent, togglable terminals

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	cmd = { "ToggleTerm", "TermExec", "ToggleTermToggleAll" },
	keys = {
		{ [[<C-\>]], desc = "Toggle Terminal" },
		{ "<leader>Tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
		{ "<leader>Th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
		{ "<leader>Tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
		{ "<leader>Ta", "<cmd>ToggleTermToggleAll<cr>", desc = "Toggle All Terminals" },
	},
	opts = {
		open_mapping = [[<C-\>]],
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.4)
			end
		end,
		shade_terminals = true,
		start_in_insert = true,
		persist_size = true,
		persist_mode = true,
		direction = "float",
		close_on_exit = true,
		float_opts = {
			border = "rounded",
			winblend = 0,
		},
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- Easier navigation out of terminal buffers
		vim.api.nvim_create_autocmd("TermOpen", {
			pattern = "term://*toggleterm#*",
			callback = function()
				local o = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], o)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], o)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], o)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], o)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], o)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], o)
			end,
		})
	end,
}
