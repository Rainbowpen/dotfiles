return {
	"hrsh7th/nvim-cmp",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"lukas-reineke/cmp-under-comparator",
		"mtoohey31/cmp-fish",
	},

	opts = function()
		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "",
		}

		local cmp = require("cmp")
		local cmplsp = require("cmp_nvim_lsp")
		local compare = require("cmp.config.compare")
		local luasnip = require("luasnip")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmplsp.setup()

		cmp.setup({
			preselect = false,
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					local kind = vim_item.kind
					vim_item.kind = " " .. (kind_icons[kind] or "?") .. ""
					local source = entry.source.name
					vim_item.menu = "[" .. source .. "]"

					return vim_item
				end,
			},
			sorting = {
				priority_weight = 1.0,
				comparators = {
					compare.offset,
					compare.exact,
					compare.score,
					compare.recently_used,
					require("cmp-under-comparator").under,
					compare.kind,
				},
			},
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = false,
				disallow_partial_matching = true,
				disallow_prefix_unmatching = true,
			},
			min_length = 0, -- allow for `from package import _` in Python
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- no not select first item
				["<C-e>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "lazydev", max_item_count = 5 },
				{ name = "luasnip", max_item_count = 5 },
				{ name = "nvim_lsp", max_item_count = 20 },
				{ name = "path", max_item_count = 5 },
				{ name = "nvim_lua", max_item_count = 5 },
				{ name = "buffer", max_item_count = 5, keyword_length = 3 },
				{ name = "nvim_lsp_signature_help", max_item_count = 5 },
				{
					name = "spell",
					max_item_count = 5,
					keyword_length = 3,
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return false
						end,
						preselect_correct_word = true,
					},
				},
				{ name = "fish" },
				{ name = "path" },
			},
			performance = {
				max_view_entries = 20,
			},
			window = { documentation = cmp.config.window.bordered(), completion = cmp.config.window.bordered() },
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			matching = { disallow_symbol_nonprefix_matching = false },
		})
	end,
}
