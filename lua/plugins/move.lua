return {
    'fedepujol/move.nvim',
    opts = {
        line = {
            enable = true, -- Enables line movement
            indent = true -- Toggles indentation
        },
        block = {
            enable = true, -- Enables block movement
            indent = true -- Toggles indentation
        },
        word = {
            enable = true -- Enables word movement
        },
        char = {
            enable = false -- Enables char movement
        }
    },
    keys = { -- Normal-mode commands
    {
        '<S-j>',
        ':MoveLine(1)<CR>',
        desc = 'Move line down'
    }, {
        '<S-k>',
        ':MoveLine(-1)<CR>',
        desc = 'Move line up'
    }, -- Visual-mode commands
    {
        '<S-j>',
        ':MoveBlock(1)<CR>',
        mode = 'v',
        desc = 'Move block down'
    }, {
        '<S-k>',
        ':MoveBlock(-1)<CR>',
        mode = 'v',
        desc = 'Move block up'
    }}
}
