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
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "gruvbox_dark",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                }
            })
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
        "vimpostor/vim-tpipeline",
        lazy = false,
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
