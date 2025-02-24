return {
    { "tpope/vim-fugitive",     event = { "BufReadPost", "BufNewFile" } },
    { "airblade/vim-gitgutter", event = { "BufReadPost", "BufNewFile" } },
    {
        "sindrets/diffview.nvim",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "DiffviewOpen", "DiffviewClose" },
        init = function()
            vim.keymap.set("n", "<leader>d", function()
                if next(require("diffview.lib").views) == nil then
                    vim.cmd "DiffviewOpen"
                else
                    vim.cmd "DiffviewClose"
                end
            end, { desc = "Diffview: Toggle", silent = true })
        end,
    }
}
