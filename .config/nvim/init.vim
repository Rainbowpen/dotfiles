" --------------------------------------
"| This init.vim is created by Simonjan |
" --------------------------------------


" ---System path & Plugin install---
set nocompatible              " required
filetype off                  " required

set viminfo+='1000,n~/.local/share/nvim/viminfo

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
	Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'akinsho/bufferline.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'scrooloose/syntastic'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rust-lang/rust.vim'
    Plug 'yuezk/vim-js' " A Vim syntax highlighting plugin for JavaScript and Flow.js
    Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
    Plug 'junegunn/fzf.vim' " needed for previews
    Plug 'tmhedberg/SimpylFold' " python fold with style
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
call plug#end()

filetype plugin indent on    " required

" --- include lua config
lua require('config')

" ---FONTS---
set encoding=utf-8
set guifont="Fira Code Retina":h13 " set font for gui version's neovim

" ---EDIT style---
source $HOME/.config/nvim/editstyle.vim

" galaxyline
lua require('galaxyline/statusline')

" toggleterm
lua require('toggleterm-conf')

" nvim-tree
source $HOME/.config/nvim/nvim-tree.vim
lua require('nvim-tree-conf')

" Kite
source $HOME/.config/nvim/kite.vim

" rust-lang
source $HOME/.config/nvim/rust.vim

" autocmd
source $HOME/.config/nvim/autocmd.vim

" syntastic
source $HOME/.config/nvim/syntastic.vim

" indent-blankline
lua require('indent-blankline-conf')

" colorizer
lua require('colorizer-conf')


" ---Control---
source $HOME/.config/nvim/control.vim


" ---THEME---
source $HOME/.config/nvim/dracula.vim
lua require("top-bufferline") 

