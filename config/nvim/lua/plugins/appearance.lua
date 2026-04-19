return {
    { "romgrk/barbar.nvim",      event = { "BufReadPost", "BufNewFile" } }, -- Tab-style buffer line
    { "vimpostor/vim-tpipeline", lazy = false }, -- Pipe statusline to tmux (must load early)
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                palette_overrides = {
                    dark0 = "#000000",
                    dark1 = "#111111",
                },
            })
            vim.cmd.colorscheme "gruvbox"

            -- Style native completion popup to match dark theme
            vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1d2021", fg = "#ebdbb2" })
            vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#504945", fg = "#ebdbb2", bold = true })
            vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "#1d2021", fg = "#504945" })
            vim.api.nvim_set_hl(0, "PmenuShadow", { bg = "#000000" })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "dokwork/lualine-ex"
        },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_c = {
                        {
                            "ex.cwd",
                            depth = 2,
                            prefix = "…",
                            max_length = 0.2
                        }
                    },
                    lualine_x = { "encoding", "fileformat", "filetype", "lsp_status" },
                },
            })

            -- Redirect lualine's statusline to tmux via tpipeline when inside tmux,
            -- preventing duplicate statuslines (one in nvim, one in tmux).
            local lualine_nvim_opts = require "lualine.utils.nvim_opts"
            local base_set = lualine_nvim_opts.set

            lualine_nvim_opts.set = function(name, val, scope)
                if vim.env.TMUX ~= nil and name == "statusline" then
                    if scope and scope.window == vim.api.nvim_get_current_win() then
                        vim.g.tpipeline_statusline = val
                        vim.cmd("silent! call tpipeline#update()")
                    end
                    return
                end
                return base_set(name, val, scope)
            end
        end,
    },
}
