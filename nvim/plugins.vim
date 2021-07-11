" auto install vim-plug and plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'amix/vim-zenroom2'                                    " Markdown editing in zen mode 
Plug 'dbakker/vim-projectroot'                              " Dependency (fzf.vim)
Plug 'dense-analysis/ale'                                   " LSP, linting, formatting
Plug 'edkolev/tmuxline.vim'                                 " Tmux status line generator using airline
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }         " Go support
Plug 'iamcco/markdown-preview.nvim', {
  \ 'do': { -> mkdp#util#install()  },
  \ 'for': ['markdown', 'vim-plug']
  \ }                                                       " Markdown preview
Plug 'jiangmiao/auto-pairs'                                 " Bracket matching
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}           " Dependency (fzf.vim) 
Plug 'junegunn/fzf.vim'                                     " Fuzzy finder
Plug 'junegunn/goyo.vim'                                    " Zen mode
Plug 'lervag/vimtex'                                        " LaTeX support
Plug 'maxbrunsfeld/vim-yankstack'                           " Turns default register into a stack
Plug 'mhinz/vim-signify'                                    " Git changes shown in column
Plug 'mhinz/vim-startify'                                   " Start screen
Plug 'morhetz/gruvbox'                                      " Colour scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}             " Code completion
Plug 'nicwest/vim-http'                                     " REST client
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " LSP
Plug 'nvim-lua/popup.nvim'                                  " Dependency (telescope.nvim)
Plug 'nvim-lua/plenary.nvim'                                " Dependency (telescope.nvim)
Plug 'nvim-telescope/telescope.nvim'                        " Find, Filter, Preview, Pick
Plug 'ryanoasis/vim-devicons'                               " Coloured file type icons
Plug 'sheerun/vim-polyglot'                                 " Syntax highlighting/language pack
Plug 'tpope/vim-commentary'                                 " Code commenting
Plug 'tpope/vim-fugitive'                                   " Git wrapper
Plug 'tpope/vim-surround'                                   " Delete, change, add surroundings
Plug 'vim-airline/vim-airline'                              " Status and tabline
Plug 'vim-airline/vim-airline-themes'                       " Airline themes
Plug 'voldikss/vim-floaterm'                                " Floating terminal
Plug 'wakatime/vim-wakatime'                                " Coding metrics
Plug 'wfxr/minimap.vim'                                     " Minimap
Plug 'yuttie/comfortable-motion.vim'                        " Smooth scrolling

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => dense-analysis/ale 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = { 
  \ 'python': ['flake8', 'mypy'], 
  \ 'latex': ['chktex'], 
  \ 'sh': ['shellcheck'] 
  \ }
let g:ale_fixers = { 
  \ '*': ['prettier'],
  \ 'python': ['autopep8', 'isort'], 
  \ }

" Code formatting
nnoremap <leader>l :ALEFix<CR>

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
" => fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_fail_silently = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => iamcco/markdown-preview.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>m <Plug>MarkdownPreviewToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS='--reverse'

map <leader>ff :ProjectRootExe FZF<CR>
map <leader>fg :ProjectRootExe Rg<CR>
map <leader>fb :Buffers<CR>
map <leader>b :BCommits <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/goyo.vim, amix/zenroom2
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

nnoremap <silent> <leader>z :Goyo<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => maxbrunsfeld/vim-yankstack
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><nowait> <leader>e  :<C-u>CocCommand explorer<CR>
nnoremap <silent><nowait> <leader>o  :<C-u>CocCommand editor.action.organizeImport<CR>
nnoremap <silent><nowait> <leader>cm  :<C-u>CocList commands<CR>
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>

nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  :<C-u>CocFix<CR>
nmap <leader>r <Plug>(coc-rename)


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => nicwest/vim-http
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_http_split_vertically = 1
let g:vim_http_tempbuffer = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-treesitter/nvim-treesitter
"""""""""""""""""""""""""""""""""""""""""""""""""""
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
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
nnoremap <leader>gf <cmd>Telescope git_files<CR>
nnoremap <leader>c <cmd>Telescope commands<CR>

lua <<EOF
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { width = 0.9, preview_width = 0.7 }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>d :Gvdiffsplit<CR>
map <leader>s :GFiles?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline/vim-airline,vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_section_y = ''
let g:airline_theme='gruvbox'


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => voldikss/vim-floaterm 
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<C-t>'
let g:floaterm_title = "($1/$2)"

let g:floaterm_gitcommit = 'floaterm'
let g:floaterm_autoinsert = 1
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => wfxr/minimap.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:minimap_width = 2
let g:minimap_git_colors = 1
let g:minimap_auto_start = 0
let g:minimap_auto_start_win_enter = 1

command! M execute ":MinimapToggle"


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => yuttie/comfortable-motion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comfortable_motion_no_default_key_mappings = 1

nnoremap <silent> <leader>j :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <leader>k :call comfortable_motion#flick(-150)<CR>


