return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
            -- Override CR: accept completion if popup visible, otherwise autopairs handles it
            local autopairs = require("nvim-autopairs")
            local original_cr = autopairs.autopairs_cr
            vim.keymap.set("i", "<CR>", function()
                if vim.fn.pumvisible() == 1 then
                    return "<C-y>"
                else
                    return original_cr()
                end
            end, { expr = true, noremap = true })
        end,
    },
    { "OXY2DEV/markview.nvim",  lazy = false },
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
            { "y",     "<Plug>(YankyYank)",          mode = { "n", "x" },   desc = "Yank" },
            { "p",     "<Plug>(YankyPutAfter)",      mode = { "n", "x" },   desc = "Put After" },
            { "P",     "<Plug>(YankyPutBefore)",     mode = { "n", "x" },   desc = "Put Before" },
        },
    },
}
