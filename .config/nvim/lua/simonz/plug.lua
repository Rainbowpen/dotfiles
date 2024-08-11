local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('dracula/vim', { ['as'] = 'dracula' })
Plug('glepnir/galaxyline.nvim' , { ['branch'] = 'main'})
Plug('kyazdani42/nvim-web-devicons') -- Recommended (for coloured icons)
Plug('kyazdani42/nvim-tree.lua')
Plug('akinsho/bufferline.nvim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('scrooloose/syntastic')
Plug('neoclide/coc.nvim', { ['branch'] = 'release'})
--Plug('rust-lang/rust.vim')
--Plug('yuezk/vim-js') -- A Vim syntax highlighting plugin for JavaScript and Flow.js
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all'})
Plug('junegunn/fzf.vim') -- needed for previews
Plug('tmhedberg/SimpylFold') -- python fold with style
Plug('akinsho/toggleterm.nvim', { ['tag'] = 'v2.5.*'})

vim.call('plug#end')


-- galaxyline
require('simonz.galaxyline/statusline')

-- toggleterm
require('simonz.toggleterm-conf')

-- nvim-tree
require('simonz.nvim-tree-conf')

-- indent-blankline
require('simonz.indent-blankline-conf')

-- colorizer
require('simonz.colorizer-conf')

-- ---THEME---
require("simonz.top-bufferline") 

-- coc-nvim
require("simonz.coc") 

