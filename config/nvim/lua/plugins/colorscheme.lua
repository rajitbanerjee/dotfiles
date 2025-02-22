return {
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
}
