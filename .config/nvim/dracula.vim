set t_Co=256 "讓vim支援256色"
set termguicolors
set background=dark
colorscheme dracula  "Theme dark
let &t_ut='' " Make kitty terminal background not transparent
let g:dracula_inverse

augroup dracula_customization
	au!
	"autocmd ColorScheme dracula hi! link NonText      DraculaCyan
	autocmd ColorScheme dracula hi NonText     guifg=#7b7b94
	autocmd ColorScheme dracula hi CursorLine cterm=underline term=underline
augroup END



