return {
    { "tpope/vim-fugitive", event = { "BufReadPost", "BufNewFile" } },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("gitsigns").setup({})
        end,
        keys = function()
            local gitsigns = require("gitsigns")
            return {
                { "<leader>hs", gitsigns.stage_hunk,      silent = true, desc = "Git: Stage Hunk" },
                { "<leader>hu", gitsigns.undo_stage_hunk, silent = true, desc = "Git: Undo Stage Hunk" },
                {
                    "<leader>hs",
                    mode = "v",
                    function()
                        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end,
                    silent = true,
                    desc = "Git: Stage Hunk"
                },
                {
                    "<leader>hu",
                    mode = "v",
                    function()
                        gitsigns.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                    end,
                    silent = true,
                    desc = "Git: Undo Stage Hunk"
                },
                { "<leader>hS", gitsigns.stage_buffer,                 silent = true, desc = "Git: Stage Buffer" },
                { "<leader>hU", gitsigns.undo_stage_buffer,            silent = true, desc = "Git: Undo Stage Buffer" },
                { "<leader>hd", gitsigns.diffthis,                     silent = true, desc = "Git: Diff This" },
                { "<leader>hD", function() gitsigns.diffthis("~") end, silent = true, desc = "Git: Diff This" },
            }
        end,
    },
    {
        "sindrets/diffview.nvim",
        lazy = false,
        cmd = { "DiffviewOpen", "DiffviewClose" },
        init = function()
            vim.keymap.set("n", "<leader>d", function()
                if next(require("diffview.lib").views) == nil then
                    vim.cmd("DiffviewOpen")
                else
                    vim.cmd("DiffviewClose")
                end
            end, { desc = "Diffview: Toggle", silent = true })
        end,
    }
}
