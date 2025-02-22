
return {
    {
        "dense-analysis/ale",
        keys  = {
            { "<leader>l", ":ALEFix<CR>", silent = true },
        },
        config = function()
            -- vim.g.ale_disable_lsp = 1
            vim.g.ale_fixers = {
                ["*"] = { "prettier" },
                ["python"] = { "autopep8", "isort" },
                ["java"] = { "google_java_format" },
                ["sh"] = { "shfmt" },
                ["tex"] = { "latexindent" },
                ["xml"] = { "xmllint" },
            }
            vim.g.ale_java_google_java_format_options = "--aosp"
            vim.g.ale_fix_on_save = 0
        end,
    },
    {
        "neoclide/coc.nvim",
        lazy = false,
        keys = {
            { "<leader>e", ":<C-u>CocCommand explorer<CR>", noremap = true, silent = true, nowait = true },
            { "<leader>o", ":<C-u>CocCommand editor.action.organizeImport<CR>", noremap = true, silent = true, nowait = true },
            { "<leader>cm", ":<C-u>CocList commands<CR>", noremap = true, silent = true, nowait = true },
            { "<leader>a", ":<C-u>CocList diagnostics<CR>", noremap = true, silent = true, nowait = true },
            { "gd", "<Plug>(coc-definition)", silent = true },
            { "gy", "<Plug>(coc-type-definition)", silent = true },
            { "gr", "<Plug>(coc-references)", silent = true },
            { "gi", "<Plug>(coc-implementation)", silent = true },
            { "<leader>;", "<Plug>(coc-floatinput-command)", silent = true },
            { "<leader>c;", "<Plug>(coc-floatinput-coc-command)", silent = true },
            { "<leader>r", "<Plug>(coc-floatinput-rename", silent = true },
            { "<leader>ac", "<Plug>(coc-codeaction)", silent = true },
        },
        config = function()
            -- Autocomplete
            function _G.check_back_space()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
            end

            -- Use Tab for trigger completion with characters ahead and navigate
            local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
            vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
            vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

            -- Enter to accept completion
            vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

            -- Trigger autocomplete
            vim.keymap.set("i", "<C-c>", "coc#refresh()", { silent = true, expr = true })

            -- Show documentation in preview window
            function _G.show_docs()
                local cw = vim.fn.expand('<cword>')
                if vim.fn.len(vim.bo.buftype) == 0 and vim.api.nvim_eval("coc#float#has_float()") == 0 and vim.fn.CocHasProvider("hover") then
                    vim.fn.timer_start(3000, function() vim.fn.CocActionAsync('doHover') end)
                else
                    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
                end
            end
            vim.keymap.set("n", "<C-k>", "<CMD>lua _G.show_docs()<CR>", { silent = true })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "BufReadPost",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "bash",
                    "cmake",
                    "comment",
                    "dockerfile",
                    "go",
                    "graphql",
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
                    "yaml"
                },
                highlight = { enable = true },
            }
        end,
    },
}
