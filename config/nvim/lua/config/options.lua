vim.env.LANG = "en" -- Set environment language to English
vim.o.langmenu = "en" -- Set language menu to English
vim.o.history = 500 -- Store 500 commands in history
vim.o.updatetime = 50 -- Reduce update time for faster response
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.backup = false -- Disable backup files
vim.o.writebackup = false -- Disable write backup files
vim.o.swapfile = false -- Disable swap files
vim.o.scrolloff = 7 -- Keep 7 lines visible when scrolling
vim.o.cmdheight = 1 -- Set command line height to 1
vim.o.hidden = true -- Allow switching buffers without saving
vim.o.number = true -- Show line numbers
vim.o.showcmd = false -- Disable showing command in the status line
vim.o.showmode = false -- Disable showing mode (use statusline instead)
vim.o.splitbelow = true -- Split new windows below the current one
vim.o.splitright = true -- Split new windows to the right
vim.o.termguicolors = true -- Enable 24-bit RGB colors
vim.o.background = "dark" -- Set background to dark theme
vim.o.mouse = "a" -- Enable mouse support in all modes

vim.o.syntax = "on" -- Enable syntax highlighting
vim.o.ffs = "unix,dos,mac" -- Set file format detection order
vim.o.whichwrap = vim.o.whichwrap .. "<,>,h,l" -- Allow moving to next/previous line with arrow keys
vim.o.ignorecase = true -- Ignore case in search patterns
vim.o.lazyredraw = true -- Improve performance by not redrawing while running macros
vim.o.magic = true -- Enable extended regex patterns
vim.o.inccommand = "split" -- Show live preview of search & replace
vim.o.clipboard = "unnamedplus" -- Use system clipboard for copy/paste
vim.o.showmatch = true -- Highlight matching brackets
vim.o.mat = 2 -- Set time delay for matching brackets highlight
vim.o.errorbells = false -- Disable error sound
vim.o.visualbell = false -- Disable visual bell
vim.o.tm = 500 -- Timeout for key mappings (in milliseconds)
vim.o.linebreak = true -- Wrap lines at word boundaries
vim.o.textwidth = 500 -- Set maximum text width to 500 characters
vim.o.wrap = true -- Enable line wrapping
vim.o.foldlevelstart = 99 -- Open files with all folds expanded
vim.o.autoindent = true -- Enable auto-indentation
vim.o.smartindent = true -- Enable smart indentation
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.tabstop = 4 -- Set tab width to 4 spaces
vim.o.shiftwidth = 4 -- Set indentation width to 4 spaces
vim.o.list = true -- Show whitespace characters
vim.opt.listchars = { -- Define how whitespace characters are displayed
    tab = "→ ", -- Show tabs as arrows
    lead = "·", -- Show leading spaces as dots
    trail = "•", -- Show trailing spaces as bullets
    extends = "⟩", -- Show character for text extending past window
    precedes = "⟨", -- Show character for text before the window
    nbsp = "␣" -- Show non-breaking spaces explicitly
}

vim.cmd('filetype plugin indent on') -- Enable filetype-specific plugins and indentation


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
