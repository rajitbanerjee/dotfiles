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
}
