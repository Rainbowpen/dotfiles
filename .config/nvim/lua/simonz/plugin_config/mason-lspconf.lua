require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"harper_ls",
		"lua_ls",
		"pyright",
		"biome",
		"rust_analyzer",
		"pyright",
		"yamlls",
	},
	automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- Default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
})

require("lspconfig").rust_analyzer.setup({})
require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
		},
	},
})

require("lspconfig").harper_ls.setup({
	settings = {
		["harper-ls"] = {
			userDictPath = "~/.local/share/harper-ls/dictionary.dict",
			linters = {
				spell_check = true,
				spelled_numbers = false,
				an_a = true,
				sentence_capitalization = true,
				unclosed_quotes = true,
				wrong_quotes = false,
				long_sentences = true,
				repeated_words = true,
				spaces = true,
				matcher = true,
				correct_number_suffix = true,
				number_suffix_capitalization = true,
				multiple_sequential_pronouns = true,
				linking_verbs = false,
				avoid_curses = true,
			},
		},
	},
})
