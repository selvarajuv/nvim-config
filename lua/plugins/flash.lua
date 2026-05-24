-- flash.nvim: fast cursor movement anywhere on screen

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			desc = "Flash Jump",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			function()
				require("flash").remote()
			end,
			mode = "o",
			desc = "Remote Flash",
		},
		{
			"R",
			function()
				require("flash").treesitter_search()
			end,
			mode = { "o", "x" },
			desc = "Treesitter Search",
		},
	},
}
