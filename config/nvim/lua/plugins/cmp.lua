return {
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
}
