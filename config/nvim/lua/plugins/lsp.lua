return {
    {
        "folke/trouble.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                auto_close = true,
            })
            -- Redirect quickfix buffers to Trouble's UI automatically
            vim.api.nvim_create_autocmd("BufRead", {
                callback = function(ev)
                    if vim.bo[ev.buf].buftype == "quickfix" then
                        vim.schedule(function()
                            vim.cmd("cclose")
                            vim.cmd("Trouble qflist open")
                        end)
                    end
                end
            })
        end,
        keys = {
            { "<leader>xx", ":Trouble diagnostics toggle<cr>", silent = true, desc = "Trouble: Diagnostics" },
        },
    },
    {
        -- Parser management only — highlighting/indent/folding are built-in in 0.12
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "bash", "comment", "dockerfile", "go", "html", "http",
                    "java", "javascript", "json", "json5", "jsonc", "latex",
                    "lua", "make", "markdown", "markdown_inline", "perl",
                    "python", "regex", "rust", "scss", "toml", "typescript",
                    "vim", "yaml",
                },
                auto_install = true,
            })
        end,
    },
    {
        "folke/lazydev.nvim", -- Configures lua_ls to understand Neovim's Lua API
        ft = "lua",
        opts = {},
    },
    {
        -- Mason for installing LSP servers and tools (not for configuring them)
        "williamboman/mason.nvim",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup({})
            require("mason-tool-installer").setup({
                ensure_installed = {
                    "bash-language-server",
                    "gopls",
                    "lua-language-server",
                    "marksman",
                    "rust-analyzer",
                    "typescript-language-server",
                    "yaml-language-server",
                    "jdtls",
                    "prettier",
                    "shfmt",
                    "google-java-format",
                },
            })
        end,
    },
    {
        -- Conform for formatting (no built-in equivalent)
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    sh = { "shfmt" },
                    markdown = { "prettier" },
                    rust = { "rustfmt" },
                },
            })
        end,
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
    },
}
