vim.cmd [[
    colorscheme tokyonight-night

    let g:rustfmt_autosave = 1

    " auto folding
    augroup remember_folds
      autocmd!
      autocmd BufWinLeave *.py,*.rs,*.js,*.c,*.cpp mkview 
      autocmd BufWinEnter * silent! loadview 
    augroup END
    
    
    " lazygit
    "autocmd FileType * map <buffer> <F11> :lua _LAZYGIT_TOGGLE()<CR>
    
    " python3
    "" google js style tab
    set shiftwidth=4  
    
    
    "" save and run it
    function Run_python ()
      if isdirectory('.venv')   
        let run_cmd = '"poetry run python3 ' . @% . '"'
      else
        let run_cmd = '"python3 ' . @% . '"'
      endif
      execute ':TermExec cmd=' . run_cmd
    endfunction
    
    autocmd FileType python map <buffer> <F9> :w<CR>:call Run_python()<CR>
    
    "" disable coc_suggest_ in python file
    "autocmd FileType python let b:coc_suggest_disable = 1
    
    
    " octave
    "" save and run
    autocmd FileType matlab map <buffer> <F9> :w<CR>:TermExec cmd="octave %"<CR>
    
    "" save and debug
    autocmd FileType matlab map <buffer> <F10> :w<CR>:TermExec cmd="octave --persist %"<CR>
    
    
    " rust
    "" cargo run for rust
    autocmd FileType rust map <buffer> <F9> :w<CR>:TermExec cmd="cargo run"<CR>
    
    
    " javascript
    "" google js style
    set shiftwidth=2  
    
    "" disable coc_suggest_ in js file
    autocmd FileType javascript let b:coc_suggest_disable = 1
    
    "" run js via node
    autocmd FileType javascript map <buffer> <F9> :w<CR>:TermExec cmd="node %"<CR>


    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_w = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_check_on_q = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_quiet_messages = { 
    			\"type": "style",
    			\"level": "warning" }
    
    " Python
    let g:syntastic_python_checkers=['flake8'] 
    let g:syntastic_python_flake8_args='--ignore=PyQt5'
    let g:syntastic_python_python_exec = 'python' 
    let g:syntastic_python_pylint_exe = 'python -m flake8'
    
    " Javascript
    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exec = 'eslint'


    " folding
    "
    function! MyFoldText()
        let line = getline(v:foldstart)
        let folded_line_num = v:foldend - v:foldstart
        let line_text = substitute(line, '^"{\+', '', 'g')
        let fillcharcount = 67 - len(line_text) - len(folded_line_num)
        return '+'. repeat('-', 2) . '  ' . line_text . '  ' . repeat('-', fillcharcount) . ' (' . folded_line_num . ' L)'
    endfunction
    
    
    
    " Right click menu
    "
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-
    "let g:rightclick_default_config = 0
    "let g:rightclick_default_mappings = 0 
    "let g:rightclick_normal_items =  ['save' , 'quit' , 'undo' , 'redo' , 'paste']
    "let g:rightclick_normal_macros = [':w^M' , ':q^M' , 'u'    , '^R'   , 'p'    ]
    "
    "let g:rightclick_visual_items =  ['copy' , 'cut' , 'paste']
    "let g:rightclick_visual_macros = ['y'    , 'd'   , 'p'    ]
    "
    "let g:rightclick_select_items =  ['save' , 'quit' , 'undo' , 'redo' , 'paste']
    "let g:rightclick_select_macros = [':w^M' , ':q^M' , 'u'    , '^R'   , 'p'    ]





]]
