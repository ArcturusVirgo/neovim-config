vim.lsp.config('fortls', {
    cmd = {'fortls', '--notify_init', '--hover_signature', '--hover_language=fortran', '--use_signature_help'},
    filetypes = {'fortran'},
    root_markers = {'.fortls', '.git'},
    settings = {}
})

vim.lsp.enable('fortls')

