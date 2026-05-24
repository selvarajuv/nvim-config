-- Debug Adapter Protocol

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI panels for variables, watch, call stack, etc.
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
				config = function()
					local dap, dapui = require("dap"), require("dapui")
					dapui.setup()
					-- auto open UI when a debug session starts, close when it ends
					dap.listeners.after.event_initialized["dapui"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui"] = function()
						dapui.close()
					end
				end,
			},
			-- auto-install debug adapters via Mason
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = { "williamboman/mason.nvim" },
				opts = {
					ensure_installed = { "debugpy" },
						-- use default Mason adapter configs
					handlers = {},
				},
			},
		},
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "DAP Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "DAP Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "DAP Step Out",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dB",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Conditional Breakpoint",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle DAP UI",
			},
		},
	},
}
