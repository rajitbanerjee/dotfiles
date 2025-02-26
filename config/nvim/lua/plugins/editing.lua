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
}
