vim.g.mapleader = " "

-- Pasting, saving, quitting
vim.keymap.set("n", "<leader>w", ":wq<CR>", { noremap = true, desc = "Quit (Save)" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", { noremap = true, desc = "Quit (Don't Save)" })
vim.keymap.set("n", "<leader>qa", ":qa<CR>", { noremap = true, desc = "Quit (All)" })

-- Convenience
vim.keymap.set("n", "0", "^", { noremap = true, desc = "Jump (Line Start)" })
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command" })
vim.keymap.set("n", "u", ":u<CR>", { noremap = true, desc = "Undo" })
vim.keymap.set("n", "r", "<C-r>", { noremap = true, desc = "Redo" })
vim.keymap.set("n", "s", ":%s/", { noremap = true, desc = "Replace" })
vim.keymap.set("n", "Y", "y$", { noremap = true, desc = "Yank (End)" })
vim.keymap.set("n", "<leader><CR>", ":noh<CR>", { noremap = true, silent = true, desc = "Highlight Off" })

-- Moving around
vim.keymap.set("n", "<C-j>", "<C-W>j", { noremap = true, desc = "Jump (Window Down)" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { noremap = true, desc = "Jump (Window Up)" })
vim.keymap.set("n", "<C-h>", "<C-W>h", { noremap = true, desc = "Jump (Window Left)" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { noremap = true, desc = "Jump (Window Right)" })

-- Splits
vim.keymap.set("n", "<leader>s", ":vsplit<CR>", { noremap = true, silent = true, desc = "Split Window" })
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize Window (Up)" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize Window (Down)" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>",
    { noremap = true, silent = true, desc = "Resize Window (Left)" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>",
    { noremap = true, silent = true, desc = "Resize Window (Right)" })

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

vim.keymap.set("n", "q", ":Bclose<CR>:silent! tabclose<CR>", { noremap = true, silent = true, desc = "Buffer Close" })
vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true, desc = "Buffer Next" })
vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Buffer Previous" })

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
vim.keymap.set("n", "<leader>cc", ":ClearQFList<CR>:cclose<CR>", { noremap = true, desc = "Quickfix (Close)" })

-- Move selected lines up/down
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", { noremap = true, silent = true, desc = "Move Lines (Up)" })
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", { noremap = true, silent = true, desc = "Move Lines (Down)" })

-- Indentation
vim.keymap.set("i", "<S-TAB>", "<C-d>", { noremap = true, silent = true, desc = "Indent (Left)" })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent (Left)" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent (Right)" })
