return {
    {
        "ahmedkhalf/project.nvim",
        lazy = false,
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("project_nvim").setup({
                -- important: prevent project.nvim from chdir'ing and messing with telescope find & open file process
                manual_mode = true,
            })
        end,
        keys = {
            { "<leader>p", ":Telescope projects<CR>", silent = true, desc = "Telescope: Projects" },
        },
    },
    {
        "goolord/alpha-nvim",
        lazy = false,
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
        "echasnovski/mini.files",
        version = false,
        lazy = false,
        config = function()
            require("mini.files").setup({
                options = {
                    permanent_delete = false,
                },
                windows = {
                    preview = true,
                    width_preview = 100,
                },
            })
        end,
        keys = function()
            local minifiles = require("mini.files")
            return {
                {
                    "<leader>e",
                    function()
                        local buf_name = vim.api.nvim_buf_get_name(0)
                        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                        if not minifiles.close() then
                            minifiles.open(path)
                            minifiles.reveal_cwd()
                        end
                    end,
                    silent = true,
                    desc = "MiniFiles: Toggle"
                },
                { "<ESC>", minifiles.close, silent = true, desc = "MiniFiles: Close" },
            }
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
                { "<leader>ha", function() harpoon:list():add() end,                         desc = "Harpoon: Add" },
                { "<leader>1",  function() harpoon:list():select(1) end,                     desc = "Harpoon: Mark 1" },
                { "<leader>2",  function() harpoon:list():select(2) end,                     desc = "Harpoon: Mark 2" },
                { "<leader>3",  function() harpoon:list():select(3) end,                     desc = "Harpoon: Mark 3" },
                { "<leader>4",  function() harpoon:list():select(4) end,                     desc = "Harpoon: Mark 4" },
            }
        end
    },
}
