return {
    { "ibhagwan/smartyank.nvim", event = { "BufReadPost", "BufNewFile" } },
    { "jiangmiao/auto-pairs",    event = { "BufReadPost", "BufNewFile" } },
    { "mg979/vim-visual-multi",  event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-commentary",    event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-repeat",        event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-surround",      event = { "BufReadPost", "BufNewFile" } },
    { "wakatime/vim-wakatime",   event = "VeryLazy" },
    {
        "alvan/vim-closetag",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml,*.xml,*.jsx,*.tsx"
            vim.g.closetag_regions = {
                ["typescript.tsx"] = "jsxRegion,tsxRegion",
                ["javascript.jsx"] = "jsxRegion",
            }
        end,
    },
    {
        "maxbrunsfeld/vim-yankstack",
        keys = {
            { "<C-p>", "<Plug>yankstack_substitute_older_paste", silent = true, desc = "Paste (Older)" },
            { "<C-n>", "<Plug>yankstack_substitute_newer_paste", silent = true, desc = "Paste (Newer)" },
        },
        config = function()
            vim.g.yankstack_yank_keys = { "y", "d" }
        end,
    },
    {
        "yuttie/comfortable-motion.vim",
        keys = {
            { "<leader>j", ":call comfortable_motion#flick(150)<CR>",  silent = true, "Scroll (Down)" },
            { "<leader>k", ":call comfortable_motion#flick(-150)<CR>", silent = true, "Scroll (Up)" },
        },
        config = function()
            vim.g.comfortable_motion_no_default_key_mappings = 1
        end,
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = true,
        ft = "markdown",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "/Users/rajitbanerjee/Library/Mobile Documents/iCloud~md~obsidian/Documents/rajitbanerjee",
                },
            },
        },
    },
}
