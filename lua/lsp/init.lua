require("mason").setup({})

-- 统一配置
require('lsp.lsp')

-- 单个语言服务器配置
require("lsp.fortls")
require("lsp.lua_ls")
require("lsp.pyright")
require("lsp.clangd")



