return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"harper_ls",
				"lua_ls",
				"basedpyright",
				"rust_analyzer",
				"yamlls",
				"clangd",
			},
			automatic_installation = true,
		})
		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust_analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					diagnostics = {
						enable = true,
					},
					cargo = { allFeatures = true },
					-- cargo = {
					-- 	buildScripts = {
					-- 		enable = true,
					-- 	},
					-- },
					procMacro = {
						enable = true,
					},
					check = {
						command = "cargo clippy",
						allTargets = true,
					},
					checkOnSave = true,
				},
			},
			filetypes = { "rust" },
			on_attach = function(client, bufnr)
				require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end,
		})
		vim.lsp.config("basedpyright", {
			settings = {
				python = {
					pythonPath = ".venv/bin/python",
					venvPath = ".",
					venv = ".venv",
					disableTaggedHints = false,
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = "workspace",
						useLibraryCodeForTypes = true,
						autoImportCompletions = true,
					},
				},
			},
			on_attach = function(client, bufnr)
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
			end,
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
				},
			},
		})

		vim.lsp.config("harper_ls", {
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

		vim.lsp.config("arduino_language_server", {
			cmd = {
				"arduino-language-server",
				"-cli-config",
				vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
				-- uncomment the next two lines if you use the same across different projects; otherwise, see the note about project config
				-- '-fqbn',
				-- 'arduino:avr:mega',
			},
			-- capabilities = {
			-- 	textDocument = {
			-- 		semanticTokens = vim.NIL,
			-- 	},
			-- 	workspace = {
			-- 		semanticTokens = vim.NIL,
			-- 	},
			-- },
			filetypes = { "arduino" },
		})

		vim.lsp.config("ansiblels", {
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
	end,
}
