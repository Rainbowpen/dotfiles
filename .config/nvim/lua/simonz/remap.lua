vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Nvim tree
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>N", "<cmd>NvimTreeRefresh<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>")

--split navigations)
--vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
--vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
--vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
--vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

--map keys for vertical/horizontal split panel)
vim.keymap.set("n", "<leader>vs", "<C-w>v")
vim.keymap.set("n", "<leader>sv", "<C-w>s")

--map keys for resize vertical/horizontal window:)
vim.keymap.set("n", "<leader>=", "<cmd>exe \"resize \" . (winheight(0) * 4/3)<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>exe \"resize \" . (winheight(0) * 3/4)<CR>")
vim.keymap.set("n", "<leader>,", "<cmd>exe \"vertical resize \" . (winwidth(0) * 3/4)<CR>")
vim.keymap.set("n", "<leader>.", "<cmd>exe \"vertical resize \" . (winwidth(0) * 4/3)<CR>")

--Enable folding with the leaderbar)
--vim.keymap.set("n", "<leader> za")

--map keys for coc-fzf list)
--mappings)
vim.keymap.set("n", "<leader><leader>", "<cmd>Buffers<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>Rg<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Files<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>Lines<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>Tags<CR>")

-- toggleterm keymap
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>ToggleTermToggleAll<CR>", {noremap = true, silent = true})


