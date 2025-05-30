vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line go down a line." })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line go up a line." })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Delete next line." })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump down half screen." })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump up half screen." })
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "g]", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "[G]o to next error." })
vim.keymap.set("n", "g[", function()
	-- vim.diagnostic.goto_prev({ float = false })
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "[G]o to previous error." })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
--vim.keymap.set("n", "<leader>k", vim.lsp.codelens.display())

-- Neovim tree
--vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFileToggle<CR>")
-- vim.keymap.set("n", "<leader>N", "<cmd>NvimTreeRefresh<CR>")
-- vim.keymap.set("n", "<leader>n", "<cmd>NvimTreeFindFile<CR>")

-- Map keys for vertical/horizontal split panel)
vim.keymap.set("n", "<leader>vs", "<C-w>v")
vim.keymap.set("n", "<leader>sv", "<C-w>s")

-- Navigate between split buffers
vim.keymap.set("n", "<A-j>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<A-l>", "<cmd>TmuxNavigateUp<CR>")
vim.keymap.set("n", "<A-;>", "<cmd>TmuxNavigateRight<CR>")

-- Map keys for resize vertical/horizontal window:)
vim.keymap.set("n", "<leader>=", '<cmd>exe "resize " . (winheight(0) * 4/3)<CR>')
vim.keymap.set("n", "<leader>-", '<cmd>exe "resize " . (winheight(0) * 3/4)<CR>')
vim.keymap.set("n", "<leader>,", '<cmd>exe "vertical resize " . (winwidth(0) * 3/4)<CR>')
vim.keymap.set("n", "<leader>.", '<cmd>exe "vertical resize " . (winwidth(0) * 4/3)<CR>')

-- Map keys for fzf list)
vim.keymap.set("n", "<leader><leader>", "<cmd>Buffers<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>Rg<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Files<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>Lines<CR>")
vim.keymap.set("n", "<leader>t", "<cmd>Tags<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>Jump<CR>", { desc = "List jump point." })
vim.keymap.set("n", "<leader>sk", "<cmd>Maps<CR>", { desc = "[S]earch [K]eymaps" })

-- Toggleterm keymap
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>ToggleTermToggleAll<CR>", { noremap = true, silent = true })

-- MAPPINGS
vim.keymap.set("n", "<S-t>", "<Cmd>tabnew<CR>") -- new tab
vim.keymap.set("n", "<S-t>t", "<Cmd>bdelete<CR>") -- close tab

-- Move between tabs
vim.keymap.set("n", "<C-n>", "<Cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<C-p>", "<Cmd>BufferLineCyclePrev<CR>")

-- Trouble
vim.keymap.set("n", "<leader>e", "<cmd>Trouble diagnostics_preview toggle<CR>", { desc = "Show [E]rrors" })
vim.keymap.set("n", "<leader>re", "<cmd>Trouble symbols toggle<CR>", { desc = "Show [R][E]ferences" })

-- Undotree
vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })

-- Dap
-- Add these to your keybindings configuration
local dap = require("dap")
local dapui = require("dapui")

-- Basic debugging controls
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<F4>", dap.run_to_cursor, { desc = "Debug: Run to cursor" })
vim.keymap.set("n", "<F10>", dap.continue, { desc = "Debug: Start/Continue" })
--vim.keymap.set("n", "<F5>", dap., { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Conditional Breakpoint" })

-- DAP UI controls
vim.keymap.set("n", "<F11>", dapui.toggle, { desc = "Debug: Toggle UI" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })

-- Variable inspection
vim.keymap.set({ "n", "v" }, "<leader>dh", require("dap.ui.widgets").hover, { desc = "Debug: Hover Variables" })
vim.keymap.set({ "n", "v" }, "<leader>dp", require("dap.ui.widgets").preview, { desc = "Debug: Preview Variables" })

-- Terminate session
vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate" })
