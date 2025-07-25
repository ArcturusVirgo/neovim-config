return {
    'yamatsum/nvim-cursorline',
    event = 'CursorMoved',
    opts = {
        cursorline = {
            enable = true,
            timeout = 10, -- 设置高亮持续时间，单位为毫秒
            number = true, -- 是否在光标行显示行号
            virtual_text = true, -- 是否在光标行显示虚拟文本
        },
        cursorword = {
            enable = true,
            timeout = 1000, -- 设置高亮持续时间，单位为毫秒
            highlight = 'CursorWord', -- 使用的高亮组
        },
    },
    config = function(_, opts)
        require('nvim-cursorline').setup(opts)
    end,
}

