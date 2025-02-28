return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "which-key: Buffer Local Keymaps",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "airblade/vim-rooter",
            "nvim-telescope/telescope-live-grep-args.nvim",
        },
        config = function(_, opts)
            local telescope = require("telescope")
            telescope.setup(opts)
            telescope.load_extension("live_grep_args")
        end,
        opts = function()
            -- show filename first across telescope
            local function path_display(_, path)
                local function normalize_path(p)
                    return p:gsub("\\", "/")
                end

                local function normalize_cwd()
                    return normalize_path(vim.loop.cwd()) .. "/"
                end

                local function is_subdirectory(cwd, p)
                    return string.lower(p:sub(1, #cwd)) == string.lower(cwd)
                end

                local function split_filepath(p)
                    local normalized_path = normalize_path(p)
                    local normalized_cwd = normalize_cwd()
                    local filename = normalized_path:match("[^/]+$")

                    if is_subdirectory(normalized_cwd, normalized_path) then
                        local stripped_path = normalized_path:sub(#normalized_cwd + 1, -(#filename + 1))
                        return stripped_path, filename
                    else
                        local stripped_path = normalized_path:sub(1, -(#filename + 1))
                        return stripped_path, filename
                    end
                end
                local stripped_path, filename = split_filepath(path)
                if filename == stripped_path or stripped_path == "" then
                    return filename
                end
                return string.format("%s ~ %s", filename, stripped_path)
            end

            local actions = require("telescope.actions")

            return {
                defaults = {
                    preview = {
                        treesitter = false,
                    },
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            width = { padding = 0 },
                            height = { padding = 0 },
                            preview_width = 0.5,
                        },
                    },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { ".git/", "node_modules/", "build/", "env/", "tmp/", "release-info/" },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--hidden",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim",
                    },
                    path_display = path_display,
                    -- Override default mappings
                    mappings = {
                        i = {
                            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
                        }
                    }
                },
            }
        end,
        keys = function()
            local builtin = require("telescope.builtin")
            vim.g.rooter_patterns = { ".brazil/" }

            return {
                { "t",         ":Telescope<CR>",   desc = "Telescope: List" },
                { "f",         builtin.oldfiles,   desc = "Telescope: MRU" },
                { "<leader>f", builtin.find_files, desc = "Telescope: Files" },
                { "<leader>c", builtin.keymaps,    desc = "Telescope: Keymaps" },
                {
                    "<leader>g",
                    function()
                        -- Uses ripgrep args (rg) for live_grep
                        -- Command examples:
                        -- -i "Data"  # case insensitive
                        -- -g "!*.md" # ignore md files
                        -- -w # whole word
                        -- -e # regex
                        -- see "man rg" for more
                        require("telescope").extensions.live_grep_args.live_grep_args()
                    end,
                    desc = "Telescope: Grep",
                },
                {
                    "*",
                    function()
                        builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
                    end,
                    desc = "Telescope: Grep Word"
                },
                {
                    "<leader>/",
                    function()
                        builtin.current_buffer_fuzzy_find(
                            require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
                        )
                    end,
                    desc = "Telescope: Find In Buffer"
                },
            }
        end
    },
}
