-- heirline.nvim: custom statusline built from composable components
--
-- Each component is a table. Key fields:
--   init     - runs before render; populates self with state
--   static   - read-only data shared across all instances of the component
--   provider - returns the string to render in the statusline
--   hl       - highlight settings (colors, bold, etc.)
--   update   - autocommand events that trigger a re-render

return {
	"rebelot/heirline.nvim",
	config = function()
		local Mode = {
			init = function(self)
				self.mode = vim.fn.mode(1)
			end,
			static = {
				names = {
					n = "NORMAL",
					i = "INSERT",
					v = "VISUAL",
					V = "V-LINE",
					c = "COMMAND",
					R = "REPLACE",
					["\22"] = "V-BLOCK",
					t = "TERMINAL",
				},
			},
			provider = function(self)
				return " " .. (self.names[self.mode] or self.mode) .. " "
			end,
			hl = { bold = true },
			update = { "ModeChanged", pattern = "*:*" },
		}

		local FileName = {
			provider = function()
				local name = vim.api.nvim_buf_get_name(0)
				return " " .. (name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]") .. " "
			end,
		}

		local FileType = {
			provider = function()
				return vim.bo.filetype ~= "" and " " .. vim.bo.filetype .. " " or ""
			end,
		}

		local Align = { provider = "%=" }
		local Position = { provider = " %l:%c " }

		require("heirline").setup({
			statusline = { Mode, FileName, Align, FileType, Position },
		})
	end,
}
