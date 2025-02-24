return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "airblade/vim-rooter",
        },
        config = function()
            require("telescope").setup({})
            local builtin = require("telescope.builtin")
            vim.g.rooter_patterns = { "*.code-workspace", "packageInfo" }
            vim.keymap.set("n", "<leader>t", ":Telescope<CR>")
            vim.keymap.set("n", "<leader>f", builtin.find_files)
            vim.keymap.set("n", "<leader>g", builtin.live_grep)
            vim.keymap.set("n", "*", function()
                builtin.live_grep({
                    default_text = vim.fn.expand('<cword>')
                })
            end)
            vim.keymap.set("n", "<leader>/", function()
                builtin.current_buffer_fuzzy_find(
                    require('telescope.themes').get_dropdown({
                        winblend = 10,
                        previewer = false,
                    })
                )
            end)
        end
    },
}
