return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
	},

	config = function()
		-- I know this is nasty but what can you do?
		require("nvim-dap-virtual-text").setup({
			enabled = true, -- enable this plugin (the default)
			enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
			highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
			highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
			show_stop_reason = true, -- show stop reason when stopped for exceptions
			commented = false, -- prefix virtual text with comment string
			only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
			all_references = false, -- show virtual text on all all references of the variable (not only definitions)
			clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
			--- A callback that determines how a variable is displayed or whether it should be omitted
			--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
			--- @param buf number
			--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
			--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
			--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
			--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
			display_callback = function(variable, buf, stackframe, node, options)
				-- by default, strip out new line characters
				if options.virt_text_pos == "inline" then
					return " = " .. variable.value:gsub("%s+", " ")
				else
					return variable.name .. " = " .. variable.value:gsub("%s+", " ")
				end
			end,
			-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

			-- experimental features:
			all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
			virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
			virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
			-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
		})
		require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "codelldb", -- Make sure this is in your PATH
				args = { "--port", "${port}" },
			},
		}
		-- dap.adapters.python = function(cb, config)
		-- 	if config.request == "attach" then
		-- 		---@diagnostic disable-next-line: undefined-field
		-- 		local port = (config.connect or config).port
		-- 		---@diagnostic disable-next-line: undefined-field
		-- 		local host = (config.connect or config).host or "127.0.0.1"
		-- 		cb({
		-- 			type = "server",
		-- 			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
		-- 			host = host,
		-- 			options = {
		-- 				source_filetype = "python",
		-- 			},
		-- 		})
		-- 	else
		-- 		cb({
		-- 			type = "executable",
		-- 			command = "debugpy",
		-- 			args = { "-m", "debugpy.adapter" },
		-- 			options = {
		-- 				source_filetype = "python",
		-- 			},
		-- 		})
		-- 	end
		-- end
		dap.configurations.rust = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					-- build the binary.
					vim.fn.system("cargo build")
					-- Get workspace folder name and use it as binary name
					local workspace_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					return vim.fn.getcwd() .. "/target/debug/" .. workspace_name
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
			{
				name = "Launch with arguments",
				type = "codelldb",
				request = "launch",
				-- program = function()
				-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				-- end,
				program = function()
					-- build the binary.
					vim.fn.system("cargo build")
					-- Get workspace folder name and use it as binary name
					local workspace_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					return vim.fn.getcwd() .. "/target/debug/" .. workspace_name
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = function()
					local args_str = vim.fn.input("Arguments: ")
					return vim.split(args_str, " ")
				end,
			},
		}
	end,
}
