return {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon",
    },
    config = function (_, opts)
        require("tokyonight").setup(opts)
        vim.cmd("colorscheme tokyonight")
        vim.opt.cursorline = true
        vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
    end
}
