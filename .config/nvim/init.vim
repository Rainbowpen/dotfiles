" --------------------------------------
"| This init.vim is created by Simonjan |
" --------------------------------------


" ---System path & Plugin install---
set nocompatible              " required
filetype off                  " required

set viminfo+='1000,n~/.local/share/nvim/viminfo

call plug#begin('~/.local/share/nvim/plugged')
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'scrooloose/syntastic'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    "Plug 'ryanoasis/vim-devicons' " vimscript
	Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'akinsho/bufferline.nvim'
	Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'rust-lang/rust.vim'
call plug#end()

filetype plugin indent on    " required

" --- include lua config
lua require('config')


" ---THEME---
source $HOME/.config/nvim/dracula.vim
lua require("top-bufferline") 


" ---FONTS---
set encoding=utf-8
"設置字體"
set guifont="Fira Code Retina":h13 "Monaco:h13         


" ---EDIT style---
source $HOME/.config/nvim/editstyle.vim

" galaxyline
lua require('galaxyline/statusline')

" nvim-tree
source $HOME/.config/nvim/nvim-tree.vim
lua require('nvim-tree-conf')

" YCM
" source $HOME/.config/nvim/ycm.vim

" Kite
source $HOME/.config/nvim/kite.vim

" rust-lang
source $HOME/.config/nvim/rust.vim

" autocmd
source $HOME/.config/nvim/autocmd.vim

" syntastic
source $HOME/.config/nvim/syntastic.vim

" indentLine
"source $HOME/.config/nvim/indentLine.vim

" indent-blankline
source $HOME/.config/nvim/indentBlankline.vim

" colorizer
lua require('colorizer-conf')

" ---Control---
source $HOME/.config/nvim/control.vim



