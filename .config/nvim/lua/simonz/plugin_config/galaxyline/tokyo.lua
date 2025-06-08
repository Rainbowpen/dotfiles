local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = { " " }

local colors = {
	--bg = "#22262e",
	--fg = "#abb2bf",
	--green = "#97C378",
	--red = "#d47d85",
	--lightbg = "#2d3139",
	--lightbg2 = "#262a32",
	--blue = "#81A1C1",
	--yellow = "#e0c080",
	--grey = "#6f737b",
	--purple = '#c678dd',
	--orange = '#e5c07b'

	bg = "#222436",
	bg_dark = "#1e2030",
	bg_highlight = "#2f334d",
	lightbg = "#2d3139",
	lightbg2 = "#262a32",
	blue = "#82aaff",
	blue0 = "#3e68d7",
	blue1 = "#65bcff",
	blue2 = "#0db9d7",
	blue5 = "#89ddff",
	blue6 = "#b4f9f8",
	blue7 = "#394b70",
	comment = "#636da6",
	cyan = "#86e1fc",
	dark3 = "#545c7e",
	dark5 = "#737aa2",
	fg = "#c8d3f5",
	fg_dark = "#828bb8",
	fg_gutter = "#3b4261",
	green = "#c3e88d",
	green1 = "#4fd6be",
	green2 = "#41a6b5",
	magenta = "#c099ff",
	magenta2 = "#ff007c",
	orange = "#ff966c",
	purple = "#fca7ea",
	red = "#ff757f",
	red1 = "#c53b53",
	teal = "#4fd6be",
	terminal_black = "#444a73",
	yellow = "#ffc777",
	grey = "#6f737b",
}

local mode_color = function()
	local mode_colors = {
		[110] = colors.green,
		[105] = colors.blue,
		[99] = colors.green,
		[116] = colors.blue,
		[118] = colors.orange,
		[22] = colors.orange,
		[86] = colors.orange,
		[82] = colors.red,
		[115] = colors.red,
		[83] = colors.red,
	}

	local color = mode_colors[vim.fn.mode():byte()]
	if color ~= nil then
		return color
	else
		return colors.purple
	end
end

gls.left[1] = {
	ViMode = {
		provider = function()
			local aliases = {
				[110] = "NORMAL",
				[105] = "INSERT",
				[99] = "COMMAND",
				[116] = "TERMINAL",
				[118] = "VISUAL",
				[22] = "V-BLOCK",
				[86] = "V-LINE",
				[82] = "REPLACE",
				[115] = "SELECT",
				[83] = "S-LINE",
			}
			vim.api.nvim_command("hi GalaxyViMode guibg=" .. mode_color())
			local alias = aliases[vim.fn.mode():byte()]
			local mode
			if alias ~= nil then
				mode = alias
			else
				mode = vim.fn.mode():byte()
			end
			return "  " .. mode .. " "
		end,
		highlight = { colors.lightbg, colors.lightbg, "bold" },
	},
}

gls.left[2] = {
	ViMode_right_space = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.lightbg },
	},
}

gls.left[3] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.lightbg },
	},
}

gls.left[4] = {
	FileName = {
		provider = { "FileName" },
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.lightbg },
		separator = " ",
		separator_highlight = { colors.lightbg, colors.lightbg2 },
	},
}

gls.left[5] = {
	current_dir = {
		provider = function()
			local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			return "  " .. dir_name .. " "
		end,
		highlight = { colors.grey, colors.lightbg2 },
		separator = " ",
		separator_highlight = { colors.lightbg2, colors.bg },
	},
}

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 30 then
		return true
	end
	return false
end

gls.left[6] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = condition.hide_in_width,
		icon = "  ",
		highlight = { colors.grey, colors.bg },
	},
}

gls.left[7] = {
	DiffModified = {
		provider = "DiffModified",
		condition = condition.hide_in_width,
		icon = "  ",
		highlight = { colors.grey, colors.bg },
	},
}

gls.left[8] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = condition.hide_in_width,
		icon = "  ",
		separator = "",
		highlight = { colors.grey, colors.bg },
		separator_highlight = { colors.lightbg2, colors.bg },
	},
}
gls.left[9] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = { colors.red, colors.bg },
	},
}

gls.left[10] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = { colors.yellow, colors.bg },
	},
}

gls.left[11] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "  ",
		highlight = { colors.blue, colors.bg },
	},
}

gls.right[1] = {
	lsp_status = {
		provider = function(msg)
			msg = msg or "No Active Lsp"
			local clients = vim.lsp.get_clients()
			if next(clients) ~= nil then
				return " " .. "  " .. " active "
			else
				return ""
			end
		end,
		highlight = { colors.grey, colors.bg },
	},
}

gls.right[2] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.grey, colors.bg },
	},
}

gls.right[3] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.grey, colors.bg },
	},
}

gls.right[4] = {
	GitBranch = {
		provider = "GitBranch",
		icon = "   ",
		condition = condition.check_git_workspace,
		highlight = { colors.grey, colors.bg },
	},
}

gls.right[5] = {
	space = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.bg },
	},
}

gls.right[6] = {
	some_icon = {
		provider = function()
			return " "
		end,
		separator = "",
		separator_highlight = { colors.green, colors.bg },
		highlight = { colors.bg, colors.green },
	},
}

gls.right[7] = {
	line_percentage = {
		provider = "LinePercent",
		highlight = { colors.green, colors.lightbg },
		separator = " ",
		separator_highlight = { "NONE", colors.lightbg },
	},
}

gls.short_line_left[1] = {
	ViMode_right_space = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.lightbg },
	},
}

gls.short_line_left[2] = {
	FileIcon = {
		provider = "FileIcon",
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.lightbg },
	},
}

gls.short_line_left[3] = {
	FileName = {
		provider = { "FileName" },
		condition = condition.buffer_not_empty,
		highlight = { colors.fg, colors.lightbg },
		separator = " ",
		separator_highlight = { colors.lightbg, colors.lightbg2 },
	},
}

gls.short_line_left[4] = {
	current_dir = {
		provider = function()
			local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			return "  " .. dir_name .. " "
		end,
		highlight = { colors.grey, colors.lightbg2 },
		separator = " ",
		separator_highlight = { colors.lightbg2, colors.bg },
	},
}

gls.short_line_right[1] = {
	BufferType = {
		provider = "FileTypeName",
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.grey, colors.bg },
	},
}

gls.short_line_right[2] = {
	FileEncode = {
		provider = "FileEncode",
		condition = condition.hide_in_width,
		separator = " ",
		separator_highlight = { "NONE", colors.bg },
		highlight = { colors.grey, colors.bg },
	},
}

gls.short_line_right[3] = {
	GitBranch = {
		provider = "GitBranch",
		icon = "   ",
		condition = condition.check_git_workspace,
		highlight = { colors.grey, colors.bg },
	},
}

gls.short_line_right[4] = {
	space = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.bg },
	},
}

gls.short_line_right[5] = {
	some_icon = {
		provider = function()
			return " "
		end,
		separator = "",
		separator_highlight = { colors.fg, colors.bg },
		highlight = { colors.bg, colors.fg },
	},
}

gls.short_line_right[6] = {
	line_percentage = {
		provider = "LinePercent",
		highlight = { colors.fg, colors.lightbg },
		separator = " ",
		separator_highlight = { "NONE", colors.lightbg },
	},
}
