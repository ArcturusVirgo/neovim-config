return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        options = {
            offsets = {{
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            }},
        },
    },
    keys = {
        { "-", ":BufferLineCyclePrev<CR>", silent = true },
        { "=", ":BufferLineCycleNext<CR>", silent = true },
        { "<C-w>", ":bdelete<CR>", silent = true },
    },
    lazy = false,
}
