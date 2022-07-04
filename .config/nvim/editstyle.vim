"去掉vi的一致性"
set nocompatible
"顯示行號"
"set number
set number relativenumber
syntax on   "開啟語法高亮"
set colorcolumn=80
"highlight ColorColumn ctermbg=236
"let &colorcolumn="80,".join(range(81,999),",")
" 隱藏滾動條"    
set guioptions-=r 
set guioptions-=L
set guioptions-=b
set showtabline=1 "if 0 隱藏頂部標簽欄
hi Comment ctermfg=cyan "註解顏色
set nowrap  "設置不折行"
set fileformat=unix "設置以unix的格式保存文件"
set cindent     "設置C樣式的縮進格式"
set showmatch   "顯示匹配的括號"
set scrolloff=5     "距離頂部和底部5行"
set laststatus=2    "命令行為兩行"
set fenc=utf-8      "文件編碼"
set backspace=2
set mouse=a     "啟用鼠標"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小寫"
set incsearch
set hlsearch        "高亮搜索項"
set list
set listchars=tab:→\ ,trail:·,precedes:←,extends:→
set copyindent
set preserveindent
"set noexpandtab     "不允許擴展table"
set expandtab
set softtabstop=0
set shiftwidth=4     "設置table長度"
set tabstop=4   	"同上"
set whichwrap+=<,>,h,l
set autoread
set cursorline      "突出顯示當前行"
set cursorcolumn        "突出顯示當前列"
set clipboard=unnamedplus " Enable clipboard


" folding
"
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = substitute(line, '^"{\+', '', 'g')
    let fillcharcount = 67 - len(line_text) - len(folded_line_num)
    return '+'. repeat('-', 2) . '  ' . line_text . '  ' . repeat('-', fillcharcount) . ' (' . folded_line_num . ' L)'
endfunction

set foldmethod=indent
set foldtext=MyFoldText()
set fillchars=fold:\ 
