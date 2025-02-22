vim.g.mapleader = " "

-- Pasting, saving, quitting
vim.keymap.set("n", "<leader>pp", ":setlocal paste!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":wq<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { noremap = true })

-- Convenience
vim.keymap.set("n", "0", "^", { noremap = true })
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", "u", ":u<CR>", { noremap = true })
vim.keymap.set("n", "r", "<C-r>", { noremap = true })
vim.keymap.set("n", "s", ":%s/", { noremap = true })
vim.keymap.set("n", "Y", "y$", { noremap = true })
vim.keymap.set("n", "<leader><CR>", ":noh<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "qq", "<ESC>", { noremap = true })

-- Keeping it centered
vim.keymap.set("n", "J", "mzJ`z", { noremap = true })
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true })

-- Moving around
vim.keymap.set("n", "<C-j>", "<C-W>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-W>k", { noremap = true })
vim.keymap.set("n", "<C-h>", "<C-W>h", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-W>l", { noremap = true })

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Buffers
vim.api.nvim_create_user_command("Bclose", function()
    local current_buf = vim.fn.bufnr("%")
    local alternate_buf = vim.fn.bufnr("#")
    if vim.fn.buflisted(alternate_buf) == 1 then
        vim.cmd("buffer #")
    else
        vim.cmd("bnext")
    end
    if vim.fn.bufnr("%") == current_buf then
        vim.cmd("new")
    end
    if vim.fn.buflisted(current_buf) == 1 then
        vim.cmd("bdelete! " .. current_buf)
    end
end, {})

vim.keymap.set("n", "q", ":Bclose<CR>:silent! tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })

-- Quickfix
vim.g.the_primeagen_qf_g = 0
function ToggleQFList()
    if vim.g.the_primeagen_qf_g == 1 then
        vim.g.the_primeagen_qf_g = 0
        vim.cmd("cclose")
    else
        vim.g.the_primeagen_qf_g = 1
        vim.cmd("copen")
    end
end

vim.api.nvim_create_user_command("ClearQFList", "cexpr []", {})
vim.keymap.set("n", "<leader>cc", ":ClearQFList<CR>:cclose<CR>", { noremap = true })

-- Move selected lines up/down
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv", { noremap = true, silent = true })
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv", { noremap = true, silent = true })

-- Maintain visual selection after tab indentation
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
