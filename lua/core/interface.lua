-- 行号
vim.opt.relativenumber = true
vim.opt.number = true

--外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- 关闭模式显示 使用 lualine.nvim
vim.o.showmode = false


-- 当前高亮行为下划线
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
