return {
    { "windwp/nvim-autopairs",  event = "InsertEnter", opts = {} },
    { "numToStr/Comment.nvim",  event = { "BufReadPost", "BufNewFile" }, opts = {} },
    { "kylechui/nvim-surround", event = { "BufReadPost", "BufNewFile" }, opts = {} },
    { "mg979/vim-visual-multi", event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-repeat",       event = { "BufReadPost", "BufNewFile" } },
    { "wakatime/vim-wakatime",  event = "VeryLazy" },
    {
        "gbprod/yanky.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
        keys = {
            { "<C-p>", "<Plug>(YankyPreviousEntry)", desc = "Paste (Older)" },
            { "<C-n>", "<Plug>(YankyNextEntry)",     desc = "Paste (Newer)" },
            { "y",     "<Plug>(YankyYank)",          mode = { "n", "x" },        desc = "Yank" },
            { "p",     "<Plug>(YankyPutAfter)",      mode = { "n", "x" },        desc = "Put After" },
            { "P",     "<Plug>(YankyPutBefore)",     mode = { "n", "x" },        desc = "Put Before" },
        },
    },
}
