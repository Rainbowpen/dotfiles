return {
	"huggingface/llm.nvim",
	enabled = true,
	-- event = "VeryLazy",
	-- keys = {
	-- 	{
	-- 		"<c-j>",
	-- 		function()
	-- 			require("llm.completion").complete()
	-- 		end,
	-- 		mode = "i",
	-- 		desc = "complete",
	-- 	},
	-- },
	opts = {
		ide = "neovim",
		lsp = {
			-- bin_path = "~/.local/share/nvim/mason/bin/llm-ls",
			-- bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
			cmd_env = { LLM_LOG_LEVEL = "DEBUG" },
		},

		-- url = "http://10.0.0.124:11434", -- llm-ls uses "/api/generate"
		url = "http://10.0.0.117:11434", -- llm-ls uses "/api/generate"
		backend = "ollama",
		-- model = "codellama:7b-code",
		model = "qwen2.5-coder:7b-base",
		tokens_to_clear = { "<EOT>" },
		context_window = 4096,
		-- fim = {
		-- 	enabled = true,
		-- 	prefix = "<PRE> ",
		-- 	middle = " <MID>",
		-- 	suffix = " <SUF>",
		-- },
		fim = {
			enabled = true,
			prefix = "<|fim_prefix|> ",
			middle = " <|fim_middle|>",
			suffix = " <|fim_suffix|>",
		},
		enable_suggestions_on_startup = true,
		enable_suggestions_on_files = { "*.rs", "*.py", "*.sh", "*.yml", "*.md", "*.ansible" }, -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
		accept_keymap = "<c-j>",
		dismiss_keymap = "<S-Tab>",
		debounce_ms = 150,
		tls_skip_verify_insecure = false,
		request_body = {
			-- Modelfile options for the model you use
			options = {
				temperature = 0.2,
				top_p = 0.95,
			},
		},
	},
}
