" auto install vim-plug and plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Don't need ALE to worry about LSP
let g:ale_disable_lsp = 1


call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'airblade/vim-gitgutter'                                     " Git changes shown in column
  Plug 'alvan/vim-closetag'                                         " Autoclose tags (e.g. XML)
  Plug 'dense-analysis/ale'                                         " LSP, linting, formatting
  Plug 'edkolev/tmuxline.vim'                                       " Tmux status line generator using airline
  Plug 'gruvbox-community/gruvbox'                                  " Primary colour scheme
  Plug 'iamcco/markdown-preview.nvim'                               " Markdown preview
  Plug 'dbakker/vim-projectroot'                                    " Dependency (fzf.vim)
  Plug 'junegunn/fzf', {'do': { -> fzf#install() }}                 " Dependency (fzf.vim) 
  Plug 'junegunn/fzf.vim'                                           " Fuzzy finder
  Plug 'junegunn/goyo.vim'                                          " Zen mode
  Plug 'lambdalisue/glyph-palette.vim'                              " Universal palette for Nerd Fonts
  Plug 'lervag/vimtex'                                              " LaTeX support
  Plug 'maxbrunsfeld/vim-yankstack'                                 " Turns default register into a stack
  Plug 'mhinz/vim-startify'                                         " Start screen
  Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " Code completion
  Plug 'BurntSushi/ripgrep'                                         " Dependency (telescope.nvim)
  Plug 'nvim-lua/plenary.nvim'                                      " Dependency (telescope.nvim)
  Plug 'nvim-telescope/telescope.nvim'                              " Find, Filter, Preview, Pick
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}       " LSP
  Plug 'ryanoasis/vim-devicons'                                     " Coloured file type icons
  Plug 'tpope/vim-commentary'                                       " Code commenting
  Plug 'tpope/vim-fugitive'                                         " Git wrapper
  Plug 'tpope/vim-obsession'                                        " Save session
  Plug 'tpope/vim-repeat'                                           " Enables . for plugins
  Plug 'tpope/vim-surround'                                         " Delete, change, add surroundings
  Plug 'vim-airline/vim-airline'                                    " Status and tabline
  Plug 'vim-airline/vim-airline-themes'                             " Airline themes
  Plug 'voldikss/vim-floaterm'                                      " Floating terminal
  Plug 'wakatime/vim-wakatime'                                      " Coding metrics
  Plug 'Yggdroot/indentline'                                        " Indent indicator
  Plug 'yuttie/comfortable-motion.vim'                              " Smooth scrolling

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => alvan/vim-closetag
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.jsx,*.tsx'
let g:closetag_regions =  {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => dense-analysis/ale 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = { 
  \ 'python': ['flake8', 'mypy'], 
  \ 'latex': ['chktex'], 
  \ 'sh': ['shellcheck'],
  \ }
let g:ale_fixers = { 
  \ '*': ['prettier'],
  \ 'python': ['autopep8', 'isort'], 
  \ 'java': ['google_java_format'],
  \ 'sh': ['shfmt'],
  \ 'tex': ['latexindent'],
  \ 'xml': ['xmllint'],
  \ }

" Code formatting
nnoremap <leader>l :ALEFix<CR>
let g:ale_java_google_java_format_options = '--aosp'
let g:ale_fix_on_save = 0

" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" Arrows are too bold, use dots instead
let g:ale_sign_info= "•"
let g:ale_sign_error = "•"
let g:ale_sign_warning = "•"
let g:ale_sign_style_error = "•"
let g:ale_sign_style_warning = "•"


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox-community/gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gruvbox_contrast_dark = "hard"
try
  colorscheme gruvbox
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => iamcco/markdown-preview.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>m <Plug>MarkdownPreviewToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS = '--reverse'

nnoremap <leader>ff :ProjectRootExe FZF<CR>
nnoremap <leader>fg :ProjectRootExe Rg<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>z :Goyo<CR>

let g:goyo_width = "90%"
let g:goyo_height = "90%"

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set scrolloff=999
endfunction
function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set scrolloff=7
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => lambdalisue/glyph-palette.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
augroup my-glyph-palette
  autocmd! *
  autocmd FileType startify,coc-explorer call glyph_palette#apply()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => maxbrunsfeld/vim-yankstack
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => mhinz/vim-startify
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_session_before_save = [ 'silent! CocCommand explorer<CR>' ]

function! s:list_commits()
    let git = 'git'
    let commits = systemlist(git .' log --oneline | head -n10')
    let git = 'G'. git[1:]
    return map(commits, '{"line": matchstr(v:val, "\\s\\zs.*"), "cmd": "'. git .' show ". matchstr(v:val, "^\\x\\+") }')
endfunction

let g:startify_lists = [
    \ { 'header': ['   Sessions'],       'type': 'sessions' },
    \ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
    \ { 'header': ['   Commits'],        'type': function('s:list_commits') },
    \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <nowait> <leader>e  :<C-u>CocCommand explorer<CR>
nnoremap <silent> <nowait> <leader>o  :<C-u>CocCommand editor.action.organizeImport<CR>
nnoremap <silent> <nowait> <leader>cm  :<C-u>CocList commands<CR>
nnoremap <silent> <nowait> <leader>a  :<C-u>CocList diagnostics<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>r  <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf :<C-u>CocFix<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  silent call timer_start(3000, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHold * :call <SID>show_hover_doc()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-treesitter/nvim-treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "bibtex", "c", "cmake", "comment", "cpp", "dockerfile", "go", "graphql", "help", "html", "http", "java", "javascript", "json", "json5", "jsonc", "latex", "lua", "make", "markdown", "markdown_inline", "perl", "python", "r", "regex", "scss", "typescript", "vim", "yaml" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html" }, -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-telescope/telescope.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>t <cmd>Telescope <CR>
nnoremap <leader>f <cmd>Telescope find_files<CR>
nnoremap <leader>g <cmd>Telescope live_grep<CR>
nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>c <cmd>Telescope commands<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>

lua <<EOF
local actions = require("telescope.actions")
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { preview_width = 0.5 },
    },
    mappings = {
      -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
      n = {
        ["<C-j>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<C-k>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-t>"] = false, -- no tabs, buffers only
        ["<Down>"] = actions.preview_scrolling_down,
        ["<Up>"] = actions.preview_scrolling_up,
        ["q"] = actions.delete_buffer,
      },
      i = {
        ["<C-x>"] = actions.delete_buffer,
        ["<C-t>"] = false, -- no tabs, buffers only
        ["<Down>"] = actions.preview_scrolling_down,
        ["<Up>"] = actions.preview_scrolling_up,
      },
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
  },
})
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>d :Gvdiffsplit<CR>
nnoremap <leader>s :GFiles?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => tpope/vim-obsession
"""""""""""""""""""""""""""""""""""""""""""""""""""
command -nargs=1 Obs :Obsess $NVIM_SESSIONS/<args>.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline/vim-airline,vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'gruvbox'
let g:airline_section_y = ''
let g:airline_powerline_fonts = 1

" airline symbols
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '
let g:airline_symbols.dirty=''


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => voldikss/vim-floaterm 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_title = "($1/$2)"

let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9

command! F execute ":FloatermNew"
command! FN execute ":FloatermNext"
command! FNF execute ":FloatermFirst"
command! FNL execute ":FloatermLast"


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => yuttie/comfortable-motion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comfortable_motion_no_default_key_mappings = 1

nnoremap <silent> <leader>j :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <leader>k :call comfortable_motion#flick(-150)<CR>

