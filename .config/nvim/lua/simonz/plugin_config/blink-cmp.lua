return { -- optional blink completion source for require statements and module annotations
	"saghen/blink.cmp",
	dependencies = {
		-- "rafamadriz/friendly-snippets",
		"ribru17/blink-cmp-spell",
		"Kaiser-Yang/blink-cmp-dictionary",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	build = "cargo +nightly build --release",
	fuzzy = { implementation = "prefer_rust_with_warning" },
	-- Controls how the completion items are rendered on the popup window
	opts = {
		completion = {
			menu = {
				enabled = true,
				min_width = 15,
				max_height = 20,
				border = "rounded", -- Defaults to `vim.o.winborder` on nvim 0.11+
				winblend = 1,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				-- Keep the cursor X lines away from the top/bottom of the window
				scrolloff = 2,
				-- Note that the gutter will be disabled when border ~= 'none'
				scrollbar = true,
				-- Which directions to show the window,
				-- falling back to the next direction when there's not enough space
				direction_priority = { "s", "n" },

				-- Whether to automatically show the window when new completion items are available
				auto_show = true,

				-- Screen coordinates of the command line
				cmdline_position = function()
					if vim.g.ui_cmdline_pos ~= nil then
						local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
						return { pos[1] - 1, pos[2] }
					end
					local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
					return { vim.o.lines - height, 0 }
				end,
				draw = {
					-- We don't need label_description now because label and label_description are already
					-- combined together in label by colorful-menu.nvim.
					treesitter = { "lsp" },
					columns = { { "kind_icon" }, { "label", gap = 1 }, { "source_name" } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
		sources = {
			-- add lazydev to your completion providers
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "spell", "dictionary" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				lsp = {
					score_offset = 99,
				},
				spell = {
					name = "Spell",
					module = "blink-cmp-spell",
					score_offset = 2,
					opts = {
						-- EXAMPLE: Only enable source in `@spell` captures, and disable it
						-- in `@nospell` captures.
						enable_in_context = function()
							local curpos = vim.api.nvim_win_get_cursor(0)
							local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
							local in_spell_capture = false
							for _, cap in ipairs(captures) do
								if cap.capture == "spell" then
									in_spell_capture = true
								elseif cap.capture == "nospell" then
									return false
								end
							end
							return in_spell_capture
						end,
					},
				},
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					-- Make sure this is at least 2.
					-- 3 is recommended
					min_keyword_length = 3,

					score_offset = 0,
					opts = {
						-- options for blink-cmp-dictionary
						dictionary_directories = { vim.fn.expand("/home/simon/.local/share/english-words") },
					},
				},
			},
		},
		keymap = {
			-- set to 'none' to disable the 'default' preset
			preset = "none",
			["<C-y>"] = { "accept" },

			["<Up>"] = { "select_prev", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<Left>"] = { "scroll_documentation_up", "fallback" },
			["<Right>"] = { "scroll_documentation_down", "fallback" },

			-- disable a keymap from the preset
			["<C-e>"] = {},
		},
	},
}
