
return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "<leader>f", ":FzfLua files<CR>", silent = true },
            { "<leader>g", ":FzfLua grep_project<CR>", silent = true },
            { "*", ":FzfLua grep_cword<CR>", silent = true}
        },
        config = function()
            local act = require("fzf-lua").actions

            local function build_quickfix_list(lines)
                local qf_list = {}
                for _, line in ipairs(lines) do
                    table.insert(qf_list, { filename = line })
                end
                vim.fn.setqflist(qf_list)
                vim.cmd("copen")
                vim.cmd("cc")
            end

            require("fzf-lua").setup{
                actions = {
                    files = {
                        ["enter"]  = act.file_edit_or_qf,
                        ["ctrl-b"] = function(selected) build_quickfix_list(selected) end,
                        ["ctrl-s"] = act.file_vsplit,
                    },
                }
            }
        end,
    },
}
