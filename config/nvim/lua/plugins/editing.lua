return {
    { "jiangmiao/auto-pairs",  event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-commentary",  event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-repeat",      event = { "BufReadPost", "BufNewFile" } },
    { "tpope/vim-surround",    event = { "BufReadPost", "BufNewFile" } },
    { "wakatime/vim-wakatime", event = "VeryLazy" },
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({})
            harpoon:extend({
                UI_CREATE = function(cx)
                    vim.keymap.set("n", "l", function()
                        harpoon.ui:select_menu_item()
                    end, { buffer = cx.bufnr, desc = "Harpoon: Open" })
                end,
            })
        end,
        keys = function()
            local harpoon = require("harpoon")
            return {
                { "<leader>hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: List" },
                { "<leader>a",  function() harpoon:list():add() end,                         desc = "Harpoon: Add" },
                { "<leader>1",  function() harpoon:list():select(1) end,                     desc = "Harpoon: Mark 1" },
                { "<leader>2",  function() harpoon:list():select(2) end,                     desc = "Harpoon: Mark 2" },
                { "<leader>3",  function() harpoon:list():select(3) end,                     desc = "Harpoon: Mark 3" },
                { "<leader>4",  function() harpoon:list():select(4) end,                     desc = "Harpoon: Mark 4" },
            }
        end
    },
}
