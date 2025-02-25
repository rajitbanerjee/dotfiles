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
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("live_grep_args")
        end,
        opts = {
            defaults = {
                file_ignore_patterns = { ".git", "node_modules", "build", "env" },
                vimgrep_arguments = {
                    "rg",
                    "--color=never",
                    "--no-heading",
                    "--hidden",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                    "--trim",
                },
            },
        },
        keys = function()
            local telescope = require("telescope.builtin")
            vim.g.rooter_patterns = { "*.code-workspace", "packageInfo" }

            return {
                { "t",         ":Telescope<CR>",     desc = "Telescope: List" },
                { "f",         telescope.oldfiles,   desc = "Telescope: MRU" },
                { "<leader>f", telescope.find_files, desc = "Telescope: Find" },
                { "<leader>c", telescope.commands,   desc = "Telescope: Commands" },
                {
                    "<leader>g",
                    function()
                        -- Uses ripgrep args (rg) for live_grep
                        -- Command examples:
                        -- -i "Data"  # case insensitive
                        -- -g "!*.md" # ignore md files
                        -- -w # whole word
                        -- -e # regex
                        -- see "man rg" for more
                        require("telescope").extensions.live_grep_args.live_grep_args()
                    end,
                    desc = "Telescope: Grep",
                },
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
