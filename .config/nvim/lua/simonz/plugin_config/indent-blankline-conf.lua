return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		local highlight = {
			"RainbowGray",
			"RainbowBlue",
			"RainbowYellow",
			"RainbowRed",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowGray", { fg = "#7B7B94" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			vim.opt.list = true
			vim.opt.listchars = {
				tab = "│ ",
				trail = "⋅",
				nbsp = "+",
				space = "⋅",
			}
		end)

		require("ibl").setup({ scope = { highlight = highlight } })
		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

		--vim.opt.termguicolors = true
		--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#7B7B94 gui=nocombine]]
		--vim.cmd [[highlight Whitespace guifg=#7B7B94 gui=nocombine]]
		--
		--vim.opt.list = true
		--vim.opt.listchars:append("space:⋅")
		----vim.opt.listchars:append("eol:↴")
		--
		--require("indent_blankline").setup {
		--    show_end_of_line = true,
		--    space_char_blankline = " ",
		--    char_highlight_list = {
		--        "IndentBlanklineIndent1",
		--        "Whitespace",
		--    },
		--    --show_current_context = true,
		--    --show_current_context_start = true,
		--}
	end,
}
