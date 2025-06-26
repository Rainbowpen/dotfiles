vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
vim.opt.showtabline = 1
vim.opt.wrap = false
vim.opt.fileformat = "unix"
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
---vim.opt.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autoread = true
-- vim.opt.autoindent = true
-- vim.opt.smartindent = true
-- vim.opt.cindent = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.modifiable = true
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
vim.diagnostic.config({ virtual_text = false })
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.g.netrw_winsize = 100

vim.filetype.add({
	extension = {
		ansible = "yaml.ansible",
	},
})
