vim.env.LANG = "en" -- Set environment language to English
vim.o.background = "dark" -- Set background to dark theme
vim.o.backup = false -- Disable backup files
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1 -- Set command line height to 1
vim.o.errorbells = false -- Disable error sound
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.ffs = "unix,dos,mac" -- Set file format detection order
-- Fold settings are in treesitter config (lsp.lua)
vim.o.history = 500 -- Store 500 commands in history
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.langmenu = "en" -- Set language menu to English
vim.o.linebreak = true -- Wrap lines at word boundaries
vim.o.list = true -- Show whitespace characters
vim.o.number = true -- Show line numbers
vim.o.scrolloff = 7 -- Keep 7 lines visible when scrolling
vim.o.shiftwidth = 4 -- Set indentation width to 4 spaces
vim.o.showcmd = false -- Disable showing command in the status line
vim.o.showmatch = true -- Highlight matching brackets
vim.o.showmode = false -- Disable showing mode (use statusline instead)
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.splitbelow = true -- Split new windows below the current one
vim.o.splitright = true -- Split new windows to the right
vim.o.swapfile = false -- Disable swap files
vim.o.tabstop = 4 -- Set tab width to 4 spaces
vim.o.textwidth = 0 -- Set maximum text width to 0 for soft wrapping
vim.o.timeoutlen = 500 -- Timeout for key mappings (in milliseconds)
vim.o.updatetime = 50 -- Reduce update time for faster response
vim.o.visualbell = false -- Disable visual bell
vim.o.whichwrap = vim.o.whichwrap .. "<,>,h,l" -- Allow moving to next/previous line with arrow keys
vim.o.wrap = true -- Enable line wrapping
vim.o.writebackup = false -- Disable write backup files

-- Treesitter folding (built-in in 0.12)
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldenable = false -- Start with folds open
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.opt.listchars = { -- Define how whitespace characters are displayed
    tab = "→ ", -- Show tabs as arrows
    lead = "·", -- Show leading spaces as dots
    trail = "•", -- Show trailing spaces as bullets
    extends = "⟩", -- Show character for text extending past window
    precedes = "⟨", -- Show character for text before the window
    nbsp = "␣" -- Show non-breaking spaces explicitly
}

-- Native auto-completion (Neovim 0.12+)
vim.o.autocomplete = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.pumborder = "rounded"

-- TAB/S-TAB to cycle through completion suggestions (S-TAB is in keymaps.lua)
vim.keymap.set("i", "<TAB>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<TAB>"
end, { expr = true })
-- Ctrl+S to manually trigger completion (overrides built-in signature help)
vim.keymap.set("i", "<C-s>", "<C-x><C-o>", { noremap = true, desc = "Trigger Completion" })

-- Set text as default filetype
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "" then vim.bo.filetype = "text" end
    end
})

-- Return to last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local last_pos = vim.fn.line("'\"")
        if last_pos > 1 and last_pos <= vim.fn.line("$") then
            vim.cmd("normal! g'\"")
        end
    end
})

-- Persist undo history
if vim.fn.has('persistent_undo') == 1 then
    local target_path = vim.fn.expand("~/.config/vim-persisted-undo/")
    if vim.fn.isdirectory(target_path) == 0 then
        vim.fn.system("mkdir -p " .. target_path)
    end
    vim.o.undodir = target_path
    vim.o.undofile = true
end
