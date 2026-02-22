return {
    {
        "goolord/alpha-nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local theta = require("alpha.themes.theta")
            local dashboard = require("alpha.themes.dashboard")
            theta.buttons.val = {
                dashboard.button("e", "  New file", "<cmd>ene<CR>"),
                dashboard.button("<leader>f", "󰈞  Find file"),
                dashboard.button("<leader>g", "󰊄  Live grep"),
                dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
                dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
            }
            require("alpha").setup(theta.config)
        end,
    },
    {
        "echasnovski/mini.files",
        version = false,
        config = function()
            local minifiles = require("mini.files")

            minifiles.setup({
                options = {
                    permanent_delete = false,
                },
                windows = {
                    max_number = 2,
                    preview = true,
                    width_focus = 50,
                    width_preview = 100,
                },
            })

            local nsMiniFiles = vim.api.nvim_create_namespace("mini_files_git")
            local nsPushPull = vim.api.nvim_create_namespace("mini_files_push_pull")
            local gitStatusCache = {}
            local pushPullCache = {}
            local cacheTimeout = 2000
            local uv = vim.uv or vim.loop

            local function isSymlink(path)
                local stat = uv.fs_lstat(path)
                return stat and stat.type == "link"
            end

            local function mapSymbols(status, is_symlink)
                local statusMap = {
                    [" M"] = { symbol = "•", hlGroup = "MiniDiffSignChange" },
                    ["M "] = { symbol = "✹", hlGroup = "MiniDiffSignChange" },
                    ["MM"] = { symbol = "≠", hlGroup = "MiniDiffSignChange" },
                    ["A "] = { symbol = "+", hlGroup = "MiniDiffSignAdd" },
                    ["AA"] = { symbol = "≈", hlGroup = "MiniDiffSignAdd" },
                    ["D "] = { symbol = "-", hlGroup = "MiniDiffSignDelete" },
                    ["AM"] = { symbol = "⊕", hlGroup = "MiniDiffSignChange" },
                    ["AD"] = { symbol = "-•", hlGroup = "MiniDiffSignChange" },
                    ["R "] = { symbol = "→", hlGroup = "MiniDiffSignChange" },
                    ["U "] = { symbol = "‖", hlGroup = "MiniDiffSignChange" },
                    ["UU"] = { symbol = "⇄", hlGroup = "MiniDiffSignAdd" },
                    ["UA"] = { symbol = "⊕", hlGroup = "MiniDiffSignAdd" },
                    ["??"] = { symbol = "?", hlGroup = "MiniDiffSignDelete" },
                    ["!!"] = { symbol = "!", hlGroup = "MiniDiffSignChange" },
                }
                local result = statusMap[status] or { symbol = "?", hlGroup = "NonText" }
                local gitSymbol = result.symbol
                local gitHlGroup = result.hlGroup
                local symlinkSymbol = is_symlink and "↩" or ""
                local combinedSymbol = (symlinkSymbol .. gitSymbol):gsub("^%s+", ""):gsub("%s+$", "")
                local combinedHlGroup = is_symlink and "MiniDiffSignDelete" or gitHlGroup
                return combinedSymbol, combinedHlGroup
            end

            local function fetchGitStatus(cwd, callback)
                local clean_cwd = cwd:gsub("^minifiles://%d+/", "")
                local function on_exit(content)
                    if content.code == 0 then
                        callback(content.stdout)
                    end
                end
                vim.system({ "git", "status", "--ignored", "--porcelain" }, { text = true, cwd = clean_cwd }, on_exit)
            end

            local function fetchPushPull(dir, callback)
                vim.system({ "git", "rev-list", "--count", "--left-right", "@{upstream}...HEAD" }, 
                    { text = true, cwd = dir }, 
                    function(content)
                        if content.code == 0 then
                            local behind, ahead = content.stdout:match("(%d+)%s+(%d+)")
                            callback(tonumber(behind) or 0, tonumber(ahead) or 0)
                        end
                    end)
            end

            local function fetchDirtyStatus(dir, callback)
                vim.system({ "git", "status", "--porcelain" }, { text = true, cwd = dir }, function(content)
                    local staged, unstaged = false, false
                    if content.code == 0 then
                        for line in content.stdout:gmatch("[^\r\n]+") do
                            local idx, wt = line:sub(1, 1), line:sub(2, 2)
                            if wt ~= " " and wt ~= "?" and wt ~= "!" then unstaged = true end
                            if idx ~= " " and idx ~= "?" and idx ~= "!" then staged = true end
                            if staged and unstaged then break end
                        end
                    end
                    callback(staged, unstaged)
                end)
            end

            local function updateMiniWithGit(buf_id, gitStatusMap)
                vim.schedule(function()
                    local nlines = vim.api.nvim_buf_line_count(buf_id)
                    local cwd = vim.fs.root(buf_id, ".git")
                    local escapedcwd = cwd and vim.pesc(cwd)
                    if escapedcwd then escapedcwd = vim.fs.normalize(escapedcwd) end
                    for i = 1, nlines do
                        local entry = minifiles.get_fs_entry(buf_id, i)
                        if not entry then break end
                        if escapedcwd then
                            local relativePath = entry.path:gsub("^" .. escapedcwd .. "/", "")
                            local status = gitStatusMap[relativePath]
                            if status then
                                local symbol, hlGroup = mapSymbols(status, isSymlink(entry.path))
                                vim.api.nvim_buf_set_extmark(buf_id, nsMiniFiles, i - 1, 0, {
                                    sign_text = symbol,
                                    sign_hl_group = hlGroup,
                                    priority = 2,
                                    hl_mode = "combine",
                                })
                                local line = vim.api.nvim_buf_get_lines(buf_id, i - 1, i, false)[1]
                                local nameStartCol = line:find(vim.pesc(entry.name)) or 0
                                if nameStartCol > 0 then
                                    vim.api.nvim_buf_set_extmark(buf_id, nsMiniFiles, i - 1, nameStartCol - 1, {
                                        end_col = nameStartCol + #entry.name - 1,
                                        hl_group = hlGroup,
                                        hl_mode = "combine",
                                    })
                                end
                            end
                        end

                        if entry.fs_type == "directory" and vim.fn.isdirectory(entry.path .. "/.git") == 1 then
                            local line_nr = i - 1
                            local currentTime = os.time()
                            local cached = pushPullCache[entry.path]
                            if cached and currentTime - cached.time < cacheTimeout then
                                local virt = {}
                                if cached.unstaged then table.insert(virt, { "•", "MiniDiffSignChange" }) end
                                if cached.staged then table.insert(virt, { "✹", "MiniDiffSignChange" }) end
                                if cached.ahead > 0 then table.insert(virt, { " ↑" .. cached.ahead, "MiniDiffSignAdd" }) end
                                if cached.behind > 0 then table.insert(virt, { " ↓" .. cached.behind, "MiniDiffSignDelete" }) end
                                if #virt > 0 then
                                    vim.api.nvim_buf_set_extmark(buf_id, nsPushPull, line_nr, 0, {
                                        virt_text = virt, virt_text_pos = "eol", priority = 1,
                                        hl_mode = "combine",
                                    })
                                end
                            else
                                pushPullCache[entry.path] = { time = currentTime, staged = false, unstaged = false, ahead = 0, behind = 0 }
                                local cache = pushPullCache[entry.path]
                                local pending = 2
                                local function tryRender()
                                    pending = pending - 1
                                    if pending > 0 then return end
                                    vim.schedule(function()
                                        local virt = {}
                                        if cache.unstaged then table.insert(virt, { "•", "MiniDiffSignChange" }) end
                                        if cache.staged then table.insert(virt, { "✹", "MiniDiffSignChange" }) end
                                        if cache.ahead > 0 then table.insert(virt, { " ↑" .. cache.ahead, "MiniDiffSignAdd" }) end
                                        if cache.behind > 0 then table.insert(virt, { " ↓" .. cache.behind, "MiniDiffSignDelete" }) end
                                        if #virt > 0 then
                                            vim.api.nvim_buf_set_extmark(buf_id, nsPushPull, line_nr, 0, {
                                                virt_text = virt, virt_text_pos = "eol", priority = 1,
                                                hl_mode = "combine",
                                            })
                                        end
                                    end)
                                end
                                fetchDirtyStatus(entry.path, function(staged, unstaged)
                                    cache.staged = staged
                                    cache.unstaged = unstaged
                                    tryRender()
                                end)
                                fetchPushPull(entry.path, function(behind, ahead)
                                    cache.behind = behind
                                    cache.ahead = ahead
                                    tryRender()
                                end)
                            end
                        end
                    end
                end)
            end

            local function parseGitStatus(content)
                local gitStatusMap = {}
                for line in content:gmatch("[^\r\n]+") do
                    local status, filePath = string.match(line, "^(..)%s+(.*)")
                    local parts = {}
                    for part in filePath:gmatch("[^/]+") do
                        table.insert(parts, part)
                    end
                    local currentKey = ""
                    for i, part in ipairs(parts) do
                        if i > 1 then
                            currentKey = currentKey .. "/" .. part
                        else
                            currentKey = part
                        end
                        if i == #parts then
                            gitStatusMap[currentKey] = status
                        else
                            if not gitStatusMap[currentKey] then
                                gitStatusMap[currentKey] = status
                            end
                        end
                    end
                end
                return gitStatusMap
            end

            local function updateGitStatus(buf_id)
                local cwd = vim.fs.root(buf_id, ".git")
                if not cwd then
                    -- Not in a git repo, but children might be git repos — still render push/pull/dirty
                    updateMiniWithGit(buf_id, {})
                    return
                end
                local currentTime = os.time()
                if gitStatusCache[cwd] and currentTime - gitStatusCache[cwd].time < cacheTimeout then
                    updateMiniWithGit(buf_id, gitStatusCache[cwd].statusMap)
                else
                    fetchGitStatus(cwd, function(content)
                        local gitStatusMap = parseGitStatus(content)
                        gitStatusCache[cwd] = { time = currentTime, statusMap = gitStatusMap }
                        updateMiniWithGit(buf_id, gitStatusMap)
                    end)
                end
            end

            local function clearCache()
                gitStatusCache = {}
                pushPullCache = {}
            end

            local function is_single_child_dir(path)
                local children = vim.fn.readdir(path)
                return #children == 1 and vim.fn.isdirectory(path .. "/" .. children[1]) == 1
            end

            local function skip_single_child_in()
                vim.schedule(function()
                    local entry = minifiles.get_fs_entry()
                    if not entry then return end
                    local parent = vim.fn.fnamemodify(entry.path, ":h")
                    if entry.fs_type == "directory" and is_single_child_dir(parent) then
                        minifiles.go_in({})
                        skip_single_child_in()
                    end
                end)
            end

            local function skip_single_child_out()
                vim.schedule(function()
                    local entry = minifiles.get_fs_entry()
                    if not entry then return end
                    local parent = vim.fn.fnamemodify(entry.path, ":h")
                    if is_single_child_dir(parent) then
                        minifiles.go_out()
                        skip_single_child_out()
                    end
                end)
            end

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesBufferCreate",
                callback = function(args)
                    local buf_id = args.data.buf_id
                    vim.keymap.set("n", "l", function()
                        minifiles.go_in({})
                        skip_single_child_in()
                    end, { buffer = buf_id, desc = "MiniFiles: Go in (skip single-child dirs)" })
                    vim.keymap.set("n", "h", function()
                        minifiles.go_out()
                        skip_single_child_out()
                    end, { buffer = buf_id, desc = "MiniFiles: Go out (skip single-child dirs)" })
                    vim.keymap.set("n", "L", function()
                        minifiles.go_in({})
                    end, { buffer = buf_id, desc = "MiniFiles: Go in (single level)" })
                    vim.keymap.set("n", "H", function()
                        minifiles.go_out()
                    end, { buffer = buf_id, desc = "MiniFiles: Go out (single level)" })
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesExplorerOpen",
                callback = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    updateGitStatus(bufnr)
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesExplorerClose",
                callback = function()
                    clearCache()
                end,
            })

            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesBufferUpdate",
                callback = function(args)
                    local bufnr = args.data.buf_id
                    local cwd = vim.fs.root(bufnr, ".git")
                    local statusMap = cwd and gitStatusCache[cwd] and gitStatusCache[cwd].statusMap or {}
                    updateMiniWithGit(bufnr, statusMap)
                end,
            })
        end,
        keys = function()
            local minifiles = require("mini.files")
            return {
                {
                    "<leader>e",
                    function()
                        local buf_name = vim.api.nvim_buf_get_name(0)
                        local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
                        if not minifiles.close() then
                            minifiles.open(path)
                            minifiles.reveal_cwd()
                        end
                    end,
                    silent = true,
                    desc = "MiniFiles: Toggle"
                },
                { "<ESC>", minifiles.close, silent = true, desc = "MiniFiles: Close" },
            }
        end,
    },
    {
        "yuttie/comfortable-motion.vim",
        keys = {
            { "<leader>j", ":call comfortable_motion#flick(150)<CR>",  silent = true, "Scroll (Down)" },
            { "<leader>k", ":call comfortable_motion#flick(-150)<CR>", silent = true, "Scroll (Up)" },
        },
        config = function()
            vim.g.comfortable_motion_no_default_key_mappings = 1
        end,
    },
    {
        "otavioschwanck/arrow.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
        },
        opts = {
            show_icons = true,
            leader_key = "<leader>b", -- Bookmark files
            buffer_leader_key = "m",  -- Bookmark lines
            always_show_path = true,
            global_bookmarks = true,
        }
    },

}
