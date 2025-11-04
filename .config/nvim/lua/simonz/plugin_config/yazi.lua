return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		-- check the installation instructions at
		-- https://github.com/folke/snacks.nvim
		"folke/snacks.nvim",
	},
	keys = {},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = true,
        floating_window_scaling_factor = 1,
		keymaps = {
			show_help = "false",
			open_file_in_vertical_split = "false",
			open_file_in_horizontal_split = "false",
			open_file_in_tab = "false",
			grep_in_directory = "false",
			replace_in_directory = "false",
			cycle_open_buffers = "false",
			copy_relative_path_to_selected_files = "false",
			send_to_quickfix_list = "false",
			change_working_directory = "false",
			open_and_pick_window = "false",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		-- vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
}
