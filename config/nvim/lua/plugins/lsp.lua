return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "comment",
                    "dockerfile",
                    "go",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "json",
                    "json5",
                    "jsonc",
                    "latex",
                    "lua",
                    "make",
                    "perl",
                    "python",
                    "regex",
                    "scss",
                    "typescript",
                    "vim",
                    "yaml",
                },
                indent = { enable = true },
                fold = { enable = true },
                highlight = { enable = true },
                sync_install = false,
                auto_install = true,
            })
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false -- Start with folds open
            vim.opt.foldlevel = 99     -- Open most folds by default
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            'WhoIsSethDaniel/mason-tool-installer.nvim',
            "mfussenegger/nvim-jdtls",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local default_capabilities = vim.lsp.protocol.make_client_capabilities()
            default_capabilities = vim.tbl_deep_extend(
                "force",
                default_capabilities,
                cmp_nvim_lsp.default_capabilities()
            )

            -- Configurable list of LSPs to install
            local server_configs = {
                bashls = {},
                gopls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                disable = { "missing-fields" }
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                ts_ls = {},
                yamlls = {},
            }
            mason.setup({})
            local mason_ensure_installed = vim.tbl_keys(server_configs or {})

            -- Additional installations, but not configured directly with mason
            vim.list_extend(
                mason_ensure_installed,
                {
                    "jdtls",
                    "prettier",
                    "google-java-format",
                }
            )
            mason_tool_installer.setup({
                ensure_installed = mason_ensure_installed
            })

            mason_lspconfig.setup({
                handlers = {
                    function(server_name)
                        local server_config = server_configs[server_name] or {}
                        server_config.capabilities = vim.tbl_deep_extend(
                            "force",
                            default_capabilities,
                            server_config.capabilities or {}
                        )
                        lspconfig[server_name].setup(server_config)
                    end,
                    ['jdtls'] = function() end,
                },
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }

                    vim.keymap.set("n", "<leader>l", function()
                        vim.lsp.buf.format { async = true }
                    end, opts)

                    vim.keymap.set("n", "<leader>o", function()
                        vim.lsp.buf.code_action({
                            apply = true,
                            context = { only = { "source.organizeImports" } }
                        })
                    end, opts)

                    local builtin = require("telescope.builtin")

                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
                    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
                    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
                    vim.keymap.set("n", "gy", builtin.lsp_type_definitions, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                end,
            })
        end,
    },
}
