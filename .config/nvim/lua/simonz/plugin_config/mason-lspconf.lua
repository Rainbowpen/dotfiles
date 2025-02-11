require("mason-lspconfig").setup({
	ensure_installed = {
		"bashls",
		"harper_ls",
		"lua_ls",
		"pyright",
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

require("lspconfig").rust_analyzer.setup({
	settings = {
		diagnostics = {
			enable = true,
		},
		["rust_analyzer"] = {
			cargo = { allFeatures = true },
		},
	},
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
	filetypes = { "rust" },
})
require("lspconfig").pyright.setup({
	python = {
		pythonPath = ".venv/bin/python",
		venvPath = ".",
		disableTaggedHints = false,
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "openFilesOnly",
			useLibraryCodeForTypes = true,
			autoImportCompletions = true,
		},
	},
	on_attach = function(client, bufnr)
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end,
})
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

require("lspconfig").ansiblels.setup({
	cmd = { "ansible-language-server", "--stdio" },
	filetypes = { "yaml.ansible" },
	settings = {
		ansible = {
			ansible = {
				path = "ansible",
			},
			executionEnvironment = {
				enabled = false,
			},
			python = {
				interpreterPath = "python",
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
					path = "ansible-lint",
				},
			},
		},
	},
	single_file_support = true,
})
