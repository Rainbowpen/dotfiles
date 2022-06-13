set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map keys for vertical/horizontal split panel
nnoremap <leader>vs <C-w>v
nnoremap <leader>sv <C-w>s

" map keys for resize vertical/horizontal window:
nnoremap <silent> + :exe "resize " . (winheight(0) * 4/3)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/4)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 4/3)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 3/4)<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" map keys for coc-fzf list
" mappings
nnoremap <silent> <space><space> :<C-u>Rg<CR>
nnoremap <silent> <space>b       :<C-u>Buffers<CR>
nnoremap <silent> <space>f       :<C-u>Files<CR>
nnoremap <silent> <space>l       :<C-u>Lines<CR>
