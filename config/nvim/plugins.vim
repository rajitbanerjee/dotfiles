" auto install vim-plug and plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Don't need ALE to worry about LSP
let g:ale_disable_lsp = 1


call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'airblade/vim-gitgutter'                                             " Git changes shown in column
    Plug 'alvan/vim-closetag'                                                 " Autoclose tags (e.g. XML)
    Plug 'BurntSushi/ripgrep'                                                 " Dependency (fzf.vim)
    Plug 'dbakker/vim-projectroot'                                            " Dependency (fzf.vim)
    Plug 'dense-analysis/ale'                                                 " LSP, linting, formatting
    Plug 'edkolev/tmuxline.vim'                                               " Tmux status line using airline
    Plug 'gruvbox-community/gruvbox'                                          " Primary colour scheme
    Plug 'jesseleite/vim-agriculture'                                         " Raw Ag/Rg
    Plug 'jiangmiao/auto-pairs'                                               " Pair brackets, quotes
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}                         " Dependency (fzf.vim) 
    Plug 'junegunn/fzf.vim'                                                   " Fuzzy finder
    Plug 'junegunn/goyo.vim'                                                  " Zen mode
    Plug 'lambdalisue/glyph-palette.vim'                                      " Universal palette for Nerd Fonts
    Plug 'maxbrunsfeld/vim-yankstack'                                         " Turns default register into a stack
    Plug 'mhinz/vim-startify'                                                 " Start screen
    Plug 'neoclide/coc.nvim', {'branch': 'release'}                           " Code completion
    Plug 'nvim-lua/plenary.nvim'                                              " Dependency (diffview.vim)
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}               " LSP
    Plug 'romgrk/barbar.nvim'                                                 " Tabline
    Plug 'kyazdani42/nvim-web-devicons'                                       " Coloured file type icons
    Plug 'tpope/vim-commentary'                                               " Code commenting
    Plug 'tpope/vim-fugitive'                                                 " Git wrapper
    Plug 'tpope/vim-repeat'                                                   " Enables . for plugins
    Plug 'tpope/vim-surround'                                                 " Delete, change, add surroundings
    Plug 'vim-airline/vim-airline'                                            " Status and tabline
    Plug 'vim-airline/vim-airline-themes'                                     " Airline themes
    Plug 'wakatime/vim-wakatime'                                              " Coding metrics
    Plug 'yuttie/comfortable-motion.vim'                                      " Smooth scrolling

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
nnoremap <silent><leader>l :ALEFix<CR>
function _AleVisualSelection()
    normal! gvy
    vs tmp
    normal!p
    ALEFix
    normal! ggVG
    sleep 300m
endfunc
vnoremap <silent><leader>l <Esc>:call _AleVisualSelection()<CR>y:q!<CR>gvp

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
" => edkolev/tmuxline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox-community/gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom background overrides ("grubvox black")
let g:gruvbox_colors = {
    \ 'bg0': '#000000',
    \ 'bg1': '#111111',
    \ 'bg2': '#222222',
    \ 'bg3': '#333333',
    \ 'bg4': '#444444',
    \ }
try
  colorscheme gruvbox
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => jesseleite/vim-agriculture
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>/ <Plug>RgRawSearch
vnoremap / <Plug>RgRawVisualSelection<CR>
nnoremap * <Plug>RgRawWordUnderCursor<CR>
    

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let g:fzf_preview_window = ['right:50%']
let $FZF_DEFAULT_OPTS = '--reverse --bind ctrl-a:select-all'

nnoremap <leader>f :ProjectRootExe FZF<CR>
nnoremap <leader>g :ProjectRootExe Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>s :GFiles?<CR>

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-b': function('s:build_quickfix_list'),
  \ 'ctrl-s': 'vsplit' }


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>z :Goyo<CR>

let g:goyo_width = "60%"
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


" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Enter to accept completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Trigger autocomplete
inoremap <silent><expr> <C-C> coc#refresh()

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>; <Plug>(coc-floatinput-command)
nmap <silent> <leader>c; <Plug>(coc-floatinput-coc-command)
nmap <silent> <leader>r <Plug>(coc-floatinput-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf :<C-u>CocFix<CR>

function! ShowDocIfNoDiagnostic(timer_id)
    " buftype= (empty) is a normal buffer [e.g. don't check for hover on buftype=nowrite]
    if (len(&buftype) == 0 && coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
        silent call CocActionAsync('doHover')
    endif
endfunction

function! s:show_hover_doc()
  silent call timer_start(1500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHold * :call <SID>show_hover_doc()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-treesitter/nvim-treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "bibtex", "c", "cmake", "comment", "cpp", "dockerfile", "go", "graphql", "html", "http", "java", "javascript", "json", "json5", "jsonc", "latex", "lua", "make", "perl", "python", "r", "regex", "scss", "typescript", "vim", "yaml" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "html" }, -- https://github.com/nvim-treesitter/nvim-treesitter/issues/1788
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline/vim-airline,vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'gruvbox'
let g:airline_section_c = ''
let g:airline_section_y = ''
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.colnr = ' '
let g:airline_symbols.dirty=''


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => yuttie/comfortable-motion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comfortable_motion_no_default_key_mappings = 1

nnoremap <silent> <leader>j :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <leader>k :call comfortable_motion#flick(-150)<CR>

