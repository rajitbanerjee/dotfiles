return {
    { "romgrk/barbar.nvim",      event = { "BufReadPost", "BufNewFile" } },
    { "vimpostor/vim-tpipeline", lazy = false },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                palette_overrides = {
                    dark0 = "#000000",
                    dark1 = "#111111",
                    dark2 = "#222222",
                    dark3 = "#333333",
                    dark4 = "#444444",
                }
            })
            vim.cmd.colorscheme "gruvbox"
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme "catppuccin-latte"
        -- end,
    },
    {
        "folke/tokyonight.nvim",
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme "tokyonight-day"
        -- end,
    },
    {
        "projekt0n/github-nvim-theme",
        name = 'github-theme',
        -- lazy = false,
        -- priority = 1000,
        -- config = function()
        --     require("github-theme").setup({})
        --     vim.cmd.colorscheme "github_light"
        -- end,
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local theta = require("alpha.themes.theta")
            local dashboard = require("alpha.themes.dashboard")
            theta.buttons.val = {
                dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("<leader>f", "󰈞  Find file"),
                dashboard.button("<leader>g", "󰊄  Live grep"),
                dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
                dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
            }
            require("alpha").setup(theta.config)
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = { lualine_c = {} },
            })

            -- Avoid duplicate lualine on changing colorscheme
            local lualine_nvim_opts = require "lualine.utils.nvim_opts"
            local base_set = lualine_nvim_opts.set

            lualine_nvim_opts.set = function(name, val, scope)
                if vim.env.TMUX ~= nil and name == "statusline" then
                    if scope and scope.window == vim.api.nvim_get_current_win() then
                        vim.g.tpipeline_statusline = val
                        vim.cmd "silent! call tpipeline#update()"
                    end
                    return
                end
                return base_set(name, val, scope)
            end
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
            vim.keymap.set("n", "<leader>e", api.tree.toggle,
                { noremap = true, silent = true, desc = "nvim-tree: Toggle" })

            local function on_attach(bufnr)
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set("n", "*", api.marks.toggle, opts("Toggle Selection"))
                vim.keymap.set("n", "<ESC>", api.tree.close, opts("Close"))
                vim.keymap.set("n", "bm", api.marks.bulk.move, opts("Move Bookmarked"))
                vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("CD"))
                vim.keymap.set("n", "dd", api.fs.cut, opts("Cut File"))
                vim.keymap.set("n", "df", api.fs.remove, opts("Delete File"))
                vim.keymap.set("n", "g.", api.tree.toggle_hidden_filter, opts("Toggle Hidden"))
                vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Collapse / Expand"))
                vim.keymap.set("n", "l", api.node.open.edit, opts("Expand / Open"))
                vim.keymap.set("n", "s", api.node.open.vertical, opts("Open in vsplit"))
                vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Go to Parent"))
                vim.keymap.set("n", "yn", api.fs.copy.filename, opts("Copy Filename"))
                vim.keymap.set("n", "yp", api.fs.copy.absolute_path, opts("Copy Filepath"))
                vim.keymap.set("n", "yy", api.fs.copy.node, opts("Copy File"))
            end

            require("nvim-tree").setup {
                on_attach = on_attach,
                view = { width = 30 },
                renderer = {
                    group_empty = true,
                    root_folder_label = function(path)
                        return vim.fn.fnamemodify(path, ":t")
                    end,
                },
                update_focused_file = { enable = true },
                diagnostics = { enable = true },
            }
        end,
    },
}
