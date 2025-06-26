-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	{
		require("simonz.plugin_config.nvim-treesitter-conf"),
		require("simonz.plugin_config.workspace-diagnostics"),
		require("simonz.plugin_config.galaxyline"),
		require("simonz.plugin_config.yazi"),
		-- require("simonz.plugin_config.nvim-tree-conf"),
		-- require("simonz.plugin_config.netrw"),
		require("simonz.plugin_config.indent-blankline-conf"),
		require("simonz.plugin_config.colorizer-conf"),
		require("simonz.plugin_config.mason-lspconf"),
		require("simonz.plugin_config.formatter"),
		require("simonz.plugin_config.telescope"),
		require("simonz.plugin_config.trouble-nvim"),
		require("simonz.plugin_config.blink-cmp"),
		require("simonz.plugin_config.tokyonight"),
		require("simonz.plugin_config.vim-tmux-navigator"),
		require("simonz.plugin_config.tiny-inline-diagnostic"),
		require("simonz.plugin_config.auto-restore"),
		require("simonz.plugin_config.gitsigns"),
		require("simonz.plugin_config.code_runner"),
		require("simonz.plugin_config.llm"),
		require("simonz.plugin_config.undotree"),
		require("simonz.plugin_config.nvim-dap-ui"),
		require("simonz.plugin_config.lazydev"),
		require("simonz.plugin_config.colorful-menu"),
		require("simonz.plugin_config.mini_surround"),
		require("simonz.plugin_config.vim-be-good"),
		-- require("simonz.plugin_config.precognition"),
		-- require("simonz.plugin_config.top-bufferline"),
		-- require("simonz.plugin_config.toggleterm-conf"),
		-- require("simonz.plugin_config.fzf"),
		-- require("simonz.plugin_config.catppuccin"),
		-- require("simonz.plugin_config.cmp"),
		--require("simonz.plugin_config.avante"),
	},
})
