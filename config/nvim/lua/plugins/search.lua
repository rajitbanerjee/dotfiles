return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "which-key: Buffer Local Keymaps",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "airblade/vim-rooter",
        },
        config = function()
            require("telescope").setup({})
        end,
        keys = function()
            local telescope = require("telescope.builtin")
            vim.g.rooter_patterns = { "*.code-workspace", "packageInfo" }

            return {
                { "t",         ":Telescope<CR>",     desc = "Telescope: List" },
                { "f",         telescope.oldfiles,   desc = "Telescope: MRU" },
                { "<leader>f", telescope.find_files, desc = "Telescope: Find" },
                { "<leader>g", telescope.live_grep,  desc = "Telescope: Grep" },
                {
                    "*",
                    function()
                        telescope.live_grep({ default_text = vim.fn.expand("<cword>") })
                    end,
                    desc = "Telescope: Grep Word"
                },
                {
                    "<leader>/",
                    function()
                        telescope.current_buffer_fuzzy_find(
                            require('telescope.themes').get_dropdown({ winblend = 10, previewer = false })
                        )
                    end,
                    desc = "Telescope: Find In Buffer"
                },
            }
        end
    },
}
