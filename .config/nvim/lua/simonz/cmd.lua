vim.cmd([[
    colorscheme tokyonight-moon

    autocmd FileType * map <buffer> <F9> :w<CR>:RunCode<CR>

    " rust
    "" save and run it
    function Run_rust ()
        if filereadable('./Cargo.toml')
          let run_cmd = '"cargo run"'
        else
          let run_cmd = '"rust-script ' . @% . '"'
        endif
        execute ':TermExec cmd=' . run_cmd
    endfunction
    ""autocmd FileType rust map <buffer> <F9> :w<CR>:call Run_rust()<CR>


    " javascript
    "" google js style
    autocmd FileType javascript set shiftwidth=2


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


    function Set_light_theme ()
        colorscheme tokyonight-day
        lua require("simonz.plugin_config.galaxyline.tokyo-day")
    endfunction

    function Set_dark_theme ()
        colorscheme tokyonight-night
        lua require("simonz.plugin_config.galaxyline.tokyo")
    endfunction
    ]])

-- auto save after awhile.
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "VimLeavePre" }, {
	callback = function(event)
		if vim.api.nvim_buf_get_option(event.buf, "modified") then
			vim.schedule(function()
				vim.api.nvim_buf_call(event.buf, function()
					vim.cmd("silent! write")
				end)
			end)
		end
	end,
})

-- formate after save.
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
