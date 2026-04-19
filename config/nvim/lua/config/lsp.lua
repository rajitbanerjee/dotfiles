-- Native LSP config (Neovim 0.12+)
-- Servers are installed by Mason (see plugins/lsp.lua), configured here natively.
-- Built-in keymaps provided by Neovim: K (hover), gra (code action), grn (rename),
-- grr (references), gri (implementations), grt (type def), Ctrl-S (signature help).
-- Custom keymaps below override some with Telescope pickers for better UI.

-- Global LSP defaults
vim.lsp.config['*'] = {
    root_markers = { '.git' },
}

vim.lsp.config['bashls'] = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
}
vim.lsp.config['gopls'] = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_markers = { 'go.mod' },
}
vim.lsp.config['jsonls'] = {
    cmd = { 'vscode-json-language-server', '--stdio' },
    filetypes = { 'json', 'jsonc' },
}
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc' },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
}
vim.lsp.config['marksman'] = {
    cmd = { 'marksman', 'server' },
    filetypes = { 'markdown' },
}
vim.lsp.config['rust_analyzer'] = {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml' },
    settings = {
        ['rust-analyzer'] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = 'clippy' },
        },
    },
}
vim.lsp.config['ts_ls'] = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json' },
}
vim.lsp.config['yamlls'] = {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml', 'yaml.docker-compose' },
}

vim.lsp.enable({
    'bashls', 'gopls', 'jsonls', 'lua_ls',
    'marksman', 'rust_analyzer', 'ts_ls', 'yamlls',
})

-- Custom keymaps beyond built-in defaults (gra, grr, grn, gri, grt, K)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local function opts(desc)
            return { desc = "LSP: " .. desc, buffer = ev.buf, noremap = true, silent = true }
        end

        local conform = require("conform")
        vim.keymap.set("n", "<leader>l", function()
            conform.format({ async = true, lsp_format = "fallback" })
        end, opts("Format"))

        vim.keymap.set("n", "<leader>o", function()
            vim.lsp.buf.code_action({
                apply = true,
                context = { only = { "source.organizeImports" }, diagnostics = {} },
            })
        end, opts("Organize Imports"))

        -- Telescope-powered LSP navigation
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "gd", builtin.lsp_definitions, opts("Go To Definition"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go To Declaration"))
        vim.keymap.set("n", "gi", builtin.lsp_implementations, opts("Go To Implementations"))
        vim.keymap.set("n", "gr", builtin.lsp_references, opts("Find All References"))
        vim.keymap.set("n", "gy", builtin.lsp_type_definitions, opts("Go To Type Definition"))
    end,
})
