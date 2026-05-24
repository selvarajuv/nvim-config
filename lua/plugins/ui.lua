-- UI enhancements: notifications, icons, cursor mode colors, and window dimming

return {
	{
		"echasnovski/mini.icons",
		opts = {},
		init = function()
			-- Shim: intercepts requires for nvim-web-devicons so plugins that
			-- depend on it work without actually installing it.
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	{
		"mawkler/modicator.nvim",
		opts = {},
	},

	{
		"TaDaa/vimade",
		opts = {
			fadelevel = 0.4,
		},
	},

	{
		"folke/noice.nvim",
		priority = 900,
		lazy = false,
		dependencies = {
			"MunifTanjim/nui.nvim",
			{
				"rcarriga/nvim-notify",
				opts = {
					background_colour = "#000000",
				},
			},
		},
		opts = {},
		keys = {
			{ "<leader>nh", "<cmd>Noice history<cr>", desc = "Noice History" },
		},
	},
}
