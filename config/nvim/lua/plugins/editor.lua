return {
    {
        "907th/vim-auto-save",
        event = "BufReadPost",
        config = function()
            vim.g.auto_save = 1
            vim.g.auto_save_silent = 1
        end,
    },
    {
        "alvan/vim-closetag",
        event = "BufReadPost",
        config = function()
            vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.jsx,*.tsx"
            vim.g.closetag_regions = {
                ["typescript.tsx"] = "jsxRegion,tsxRegion",
                ["javascript.jsx"] = "jsxRegion",
            }
        end,
    },
    {
        "jiangmiao/auto-pairs",
        event = "BufReadPost",
    },
    {
        "junegunn/goyo.vim",
        keys = {
            { "<leader>z", ":Goyo<CR>", silent = true },
        },
        config = function()
            vim.g.goyo_width = "60%"
            vim.g.goyo_height = "90%"

            vim.api.nvim_create_autocmd("User", {
                pattern = "GoyoEnter",
                callback = function()
                    goyo_enter()
                end,
                group = vim.api.nvim_create_augroup("GoyoGroup", { clear = true }),
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "GoyoLeave",
                callback = function()
                    goyo_leave()
                end,
                group = "GoyoGroup",
            })

            function goyo_enter()
                vim.cmd("silent !tmux set status off")
                vim.cmd("silent !tmux list-panes -F '\\#F' | grep -q Z || tmux resize-pane -Z")
                vim.opt.scrolloff = 999
            end

            function goyo_leave()
                vim.cmd("silent !tmux set status on")
                vim.cmd("silent !tmux list-panes -F '\\#F' | grep -q Z && tmux resize-pane -Z")
                vim.opt.scrolloff = 7
            end
        end,
    },
    {
        "maxbrunsfeld/vim-yankstack",
        keys = {
            { "<C-p>", "<Plug>yankstack_substitute_older_paste", silent = true },
            { "<C-n>", "<Plug>yankstack_substitute_newer_paste", silent = true },
        },
        config = function()
            vim.g.yankstack_yank_keys = { "y", "d" }
        end,
    },
    {
        "romgrk/barbar.nvim",
        event = "BufReadPost",
    },
    {
        "tpope/vim-commentary",
        event = "BufReadPost",
    },
    {
        "tpope/vim-repeat",
        event = "BufReadPost",
    },
    {
        "tpope/vim-surround",
        event = "BufReadPost",
    },
    {
        "vim-airline/vim-airline",
        lazy = false,
        dependencies = {
            {
                "vim-airline/vim-airline-themes",
                config = function()
                    vim.g.airline_theme = "base16_gruvbox_dark_soft"
                end,
            },
            {
                "edkolev/tmuxline.vim",
                config = function()
                    vim.g.tmuxline_powerline_separators = 0
                    vim.g.tmuxline_separators = {
                        left = "",
                        left_alt = "",
                        right = "",
                        right_alt = "",
                        space = " ",
                    }
                end,
            },
        },
        config = function()
            vim.g.airline_section_c = ""
            vim.g.airline_section_y = ""
        end,
    },
    {
        "wakatime/vim-wakatime",
        event = "VeryLazy",
    },
    {
        "yuttie/comfortable-motion.vim",
        keys = {
            { "<leader>j", ":call comfortable_motion#flick(150)<CR>", silent = true },
            { "<leader>k", ":call comfortable_motion#flick(-150)<CR>", silent = true }, 
        },
        config = function()
            vim.g.comfortable_motion_no_default_key_mappings = 1
        end,
    },
}
