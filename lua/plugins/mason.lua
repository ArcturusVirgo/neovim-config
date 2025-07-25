return {
    {
        "williamboman/mason.nvim",
        opts = {}
    }, 
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {'fortls', 'clangd', 'lua_ls', 'pyright'},
        }
    }, 
    {
        "neovim/nvim-lspconfig",
    }
}
