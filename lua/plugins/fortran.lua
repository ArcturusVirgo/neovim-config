return {
    "wassup05/fortran.nvim",
    lazy = true,
    -- load the plugin when `ft` is fortran
    ft = {"fortran"},
    opts = {
        server_opts = {
            path = "fortls",
            args = {"--notify_init", "--lowercase_intrinsics", "--hover_signature", "--hover_language=fortran",
                    "--use_signature_help", "--enable_code_actions"},
            filetypes = {"fortran"},
            settings = {}
        },

        fpm_opts = {
            terminal = true,
            path = "fpm",
            args = {
                -- fpm args go here exactly as you would pass them to fpm
            }
        },

        formatter_opts = {
            path = "fprettify",
            format_on_save = true,
            args = {
                -- fpretiffy args go here exactly as you would pass them to fprettify
            }
        }
    }
}
