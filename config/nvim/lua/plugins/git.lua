return {
    {
        "tpope/vim-fugitive",
        event = "BufReadPost",
    },
    {
        "airblade/vim-gitgutter",
        event = "BufReadPost",
    },
    {
        "sindrets/diffview.nvim",
        event = "BufReadPost",
        keys = {
            { "<leader>d", ":DiffviewOpen<CR>", silent = true },
        },
    },
}
