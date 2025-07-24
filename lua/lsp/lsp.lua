-- 配置诊断显示（行内提示）
vim.diagnostic.config({
    virtual_text = true,  -- 启用行内提示
    signs = true,        -- 左侧符号标记
    underline = true,    -- 错误下划线
    update_in_insert = false,  -- 不在插入模式更新
    severity_sort = true, -- 按严重程度排序
})

