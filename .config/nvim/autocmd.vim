" :::'###::::'##::::'##:'########::'#######:::'######::'##::::'##:'########::
" ::'## ##::: ##:::: ##:... ##..::'##.... ##:'##... ##: ###::'###: ##.... ##:
" :'##:. ##:: ##:::: ##:::: ##:::: ##:::: ##: ##:::..:: ####'####: ##:::: ##:
" '##:::. ##: ##:::: ##:::: ##:::: ##:::: ##: ##::::::: ## ### ##: ##:::: ##:
"  #########: ##:::: ##:::: ##:::: ##:::: ##: ##::::::: ##. #: ##: ##:::: ##:
"  ##.... ##: ##:::: ##:::: ##:::: ##:::: ##: ##::: ##: ##:.:: ##: ##:::: ##:
"  ##:::: ##:. #######::::: ##::::. #######::. ######:: ##:::: ##: ########::
" ..:::::..:::.......::::::..::::::.......::::......:::..:::::..::........:::


" auto folding
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


" python3
"" google js style tab
set shiftwidth=4  

"" save and run it
autocmd FileType python map <buffer> <F9> :w<CR>:sv<BAR>term python3 %<CR>

"" disable coc_suggest_ in python file
autocmd FileType python let b:coc_suggest_disable = 1




" octave
"" save and run
autocmd FileType matlab map <buffer> <F9> :w<CR>:sv<BAR>term octave %<CR>

"" save and debug
autocmd FileType matlab map <buffer> <F10> :w<CR>:sv<BAR>term octave --persist %<CR>




" rust
"" cargo run for rust
autocmd FileType rust map <buffer> <F9> :w<CR>:sv<BAR>term cargo run<CR>




" javascript
"" google js style
set shiftwidth=2  

"" disable coc_suggest_ in js file
autocmd FileType javascript let b:coc_suggest_disable = 1

"" run js via node
autocmd FileType javascript map <buffer> <F9> :w<CR>:sv<BAR>term node %<CR>
