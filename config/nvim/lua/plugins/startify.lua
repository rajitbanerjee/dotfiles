return {
    "mhinz/vim-startify",
    config = function()
        vim.g.startify_change_to_dir = 0
        vim.g.startify_change_to_vcs_root = 1
        vim.g.startify_session_before_save = { 'silent! CocCommand explorer<CR>' }

        local function list_commits()
            local git = 'git'
            local handle = io.popen(git .. ' log --oneline | head -n10')
            if not handle then return {} end
            local result = handle:read('*a')
            handle:close()

            local commits = {}
            for line in result:gmatch("(.-)\n") do
                local hash = line:match("^(%x+)")
                local msg = line:match("%s(.*)")
                if hash and msg then
                    table.insert(commits, { line = msg, cmd = 'G' .. git:sub(2) .. ' show ' .. hash })
                end
            end
            return commits
        end

        vim.g.startify_lists = {
            { header = {'   MRU ' .. vim.fn.getcwd()}, type = 'dir' },
            { header = {'   Commits'}, type = list_commits }
        }
    end,
}
