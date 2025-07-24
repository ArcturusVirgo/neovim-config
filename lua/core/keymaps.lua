vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- 取消高亮
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

-- 取消 Q q 的功能
vim.keymap.set("n", "q", "", opts)
vim.keymap.set("n", "Q", "", opts)

-- Alt + hjkl 切换窗口
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)

-- 打开文件浏览器
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- 撤销命令
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", opts)

