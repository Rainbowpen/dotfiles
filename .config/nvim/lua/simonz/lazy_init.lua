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
end vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    {
        "xiantang/darcula-dark.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
            },
        "folke/tokyonight.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
        "nvim-treesitter/nvim-treesitter",
        "glepnir/galaxyline.nvim",
        "kyazdani42/nvim-web-devicons",
        "kyazdani42/nvim-tree.lua",
        "akinsho/bufferline.nvim",
        "lukas-reineke/indent-blankline.nvim",
        "norcalli/nvim-colorizer.lua",
        --"scrooloose/syntastic",
        --"neoclide/coc.nvim",
        --    branch = "master",
        --    build = "npm ci",
        "junegunn/fzf", 
            dir = {
              "~/.fzf"
            },
        "junegunn/fzf.vim",
        "tmhedberg/SimpylFold",
        "akinsho/toggleterm.nvim",
        "rust-lang/rust.vim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        require 'simonz.plugin_config.cmp',
        "christoomey/vim-tmux-navigator",
            event = VeryLazy,
        'rmagatti/auto-session',
            lazy = false,
        "folke/trouble.nvim",
            cmd = "Trouble",
        "mhartington/formatter.nvim"
    },
})


