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
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- Disable netrw
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            local api = require("nvim-tree.api")

            vim.keymap.set("n", "<leader>e", api.tree.toggle, { noremap = true, silent = true })

            local function on_attach(bufnr)
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                -- Key mappings
                vim.keymap.set("n", "*", api.marks.toggle, opts("Toggle Selection"))
                vim.keymap.set("n", "<CR>", api.tree.change_root_to_node, opts("CD"))
                vim.keymap.set("n", "<ESC>", api.tree.close, opts("Close"))
                vim.keymap.set("n", "bm", api.marks.bulk.move, opts("Move Bookmarked"))
                vim.keymap.set("n", "dd", api.fs.cut, opts("Cut File"))
                vim.keymap.set("n", "df", api.fs.remove, opts("Delete File"))
                vim.keymap.set("n", "g.", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
                vim.keymap.set("n", "h", api.node.open.edit, opts("Collapse / Expand"))
                vim.keymap.set("n", "l", api.node.open.edit, opts("Expand / Open"))
                vim.keymap.set("n", "s", api.node.open.vertical, opts("Open in vsplit"))
                vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Go to Parent"))
                vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Filename"))
                vim.keymap.set("n", "yp", api.fs.copy.absolute_path, opts("Copy Filepath"))
                vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy File"))
            end

            require("nvim-tree").setup {
                on_attach = on_attach,
                view = { width = 50 },
                renderer = { group_empty = true },
                update_focused_file = { enable = true },
            }
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
