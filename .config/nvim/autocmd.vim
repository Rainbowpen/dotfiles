

" run python3
autocmd FileType python map <buffer> <F9> :w<CR>:sv<BAR>term python3 %<CR>

" run cargo run for rust
autocmd FileType rust map <buffer> <F9> :w<CR>:sv<BAR>term cargo run<CR>
