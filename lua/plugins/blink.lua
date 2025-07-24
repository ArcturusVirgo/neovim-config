return {
    'saghen/blink.cmp',
    dependencies = {'rafamadriz/friendly-snippets'},
    version = '1.*',
    opts = {
        sources = {
            default = {'lsp', 'path', 'snippets', 'buffer'}
        },
        keymap = {
            preset = 'default',
            ['<Up>'] = {'select_prev', 'fallback'},
            ['<Down>'] = {'select_next', 'fallback'},
            ['<C-k>'] = {'select_prev', 'fallback'},
            ['<C-j>'] = {'select_next', 'fallback'},
            ['<Tab>'] = {'select_and_accept', 'fallback'},
            ['<C-p>'] = {'show', 'fallback'},
            ['<C-e>'] = {'hide'}
        },
        cmdline = {
            keymap = {
                preset = 'inherit',
                ['<Up>'] = {'select_prev', 'fallback'},
                ['<Down>'] = {'select_next', 'fallback'},
                ['<C-k>'] = {'select_prev', 'fallback'},
                ['<C-j>'] = {'select_next', 'fallback'},
                ['<Tab>'] = {'select_and_accept', 'fallback'},
                ['<C-p>'] = {'show', 'fallback'},
                ['<C-e>'] = {'hide'}
            },
            completion = {
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ':'
                    end
                }
            }
        }
    }
}
