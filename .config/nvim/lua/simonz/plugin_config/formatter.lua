return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},

				python = {
					require("formatter.filetypes.python").autopep8,
				},

				json = {
					require("formatter.filetypes.json").biome,
				},

				javascript = {
					require("formatter.filetypes.javascript").biome,
				},

				yaml = {
					require("formatter.filetypes.yaml").yamlfmt,
				},

				rust = {
					require("formatter.filetypes.rust").rustfmt,
				},

				arduino = {
					require("formatter.filetypes.cpp").clangformat,
				},

				["yaml.ansible"] = {
					require("formatter.filetypes.yaml").yamlfmt,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
