return {
    { "jiangmiao/auto-pairs",  event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-commentary",  event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-repeat",      event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-surround",    event = { "BufReadPost", "BufNewFile" } },
    { "wakatime/vim-wakatime", event = "VeryLazy" },
    {
        "907th/vim-auto-save",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.g.auto_save = 1
            vim.g.auto_save_silent = 2
        end,
    },
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
            { "<C-p>", "<Plug>yankstack_substitute_older_paste", silent = true },
            { "<C-n>", "<Plug>yankstack_substitute_newer_paste", silent = true },
        },
        config = function()
            vim.g.yankstack_yank_keys = { "y", "d" }
        end,
    },
    {
        "yuttie/comfortable-motion.vim",
        keys = {
            { "<leader>j", ":call comfortable_motion#flick(150)<CR>",  silent = true },
            { "<leader>k", ":call comfortable_motion#flick(-150)<CR>", silent = true },
        },
        config = function()
            vim.g.comfortable_motion_no_default_key_mappings = 1
        end,
    },
}
