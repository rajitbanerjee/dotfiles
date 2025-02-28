return {
    {
        "folke/trouble.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                auto_close = true,
            })
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
                    "markdown",
                    "markdown_inline",
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
            "stevearc/conform.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")
            local conform = require("conform")
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
                marksman = {},
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

            conform.setup({
                formatters_by_ft = {
                    markdown = { "prettier" },
                },
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
                    local function opts(desc)
                        return { desc = "LSP: " .. desc, buffer = ev.buf, noremap = true, silent = true }
                    end

                    vim.keymap.set("n", "<leader>l", function()
                        conform.format({ async = true, lsp_format = "fallback" })
                    end, opts("Format"))

                    vim.keymap.set("n", "<leader>o", function()
                        vim.lsp.buf.code_action({
                            apply = true,
                            context = { only = { "source.organizeImports" } }
                        })
                    end, opts("Organize Imports"))

                    local builtin = require("telescope.builtin")

                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go To Declaration"))
                    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts("Go To Definition"))
                    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts("Go To Implementations"))
                    vim.keymap.set("n", "gr", builtin.lsp_references, opts("Find All References"))
                    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts("Signature"))
                    vim.keymap.set("n", "gy", builtin.lsp_type_definitions, opts("Go To Type Definition"))
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
                end,
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})
            cmp.setup({
                snippet = {
                    expand = function(args) luasnip.lsp_expand(args.body) end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<S-TAB>"] = cmp.mapping.select_prev_item(),
                    ["<TAB>"] = cmp.mapping.select_next_item(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                }),
            })
        end
    },
}
