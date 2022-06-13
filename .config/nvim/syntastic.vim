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
