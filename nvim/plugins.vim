" Plugin Settings

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'amix/vim-zenroom2'                              " Markdown editing in zen mode 
Plug 'itchyny/lightline.vim'                          " Status bar
Plug 'jiangmiao/auto-pairs'                           " Bracket matching
Plug 'justinmk/vim-sneak'                             " Better search/motion specifying only 2 chars
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}     " Fuzzy finder
Plug 'junegunn/fzf.vim'                               
Plug 'junegunn/goyo.vim'                              " Zen mode
Plug 'lervag/vimtex'                                  " LaTeX support
Plug 'maxbrunsfeld/vim-yankstack'                     " Turns default register into a stack
Plug 'mhinz/vim-signify'                              " Git changes shown in column
Plug 'mhinz/vim-startify'                             " Start screen
Plug 'morhetz/gruvbox'                                " Colour scheme
Plug 'preservim/nerdtree'                             " File explorer
Plug 'ryanoasis/vim-devicons'                         " File type icons
Plug 'sheerun/vim-polyglot'                           " Syntax highlighting/language pack
Plug 'tpope/vim-commentary'                           " Code commenting
Plug 'tpope/vim-fugitive'                             " Git wrapper
Plug 'tpope/vim-surround'                             " Delete, change, add surroundings
Plug 'wakatime/vim-wakatime'                          " Coding metrics

" TODO
" ale
" autoformat
" cheat.sh-vim
" vim-go

call plug#end()


colorscheme gruvbox

" TODO rename plugin settings and sort alphabetically

""""""""""""""""""""""""""""""
" => vim-go
""""""""""""""""""""""""""""""
" let g:go_fmt_fail_silently = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ale_linters = { 'python': ['flake8', 'mypy'], 'latex': ['chktex'] }

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" " Disabling highlighting
" let g:ale_set_highlights = 0

" " Only run linting when saving the file
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-autoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap <leader>ll :Autoformat<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('popupwin')
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
    let $FZF_DEFAULT_OPTS='--reverse'
endif
map <leader>f :FZF<cr>
map <leader>g :Ag<cr>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste


""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>d :Gdiffsplit<cr>
map <leader>s :GFiles?<cr>


""""""""""""""""""""""""""""""
" => zenroom2, goyo.vim
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
let g:NERDTreeChDirMode = 2
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>
map <leader>cd :NERDTreeCWD<cr>
filetype plugin indent on

" Note: doesn't work with vim-startify
" Start NERDTree only when I start vim without file arguments
" autocmd VimEnter * if !argc() | NERDTree | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ ['mode', 'paste'],
            \             ['fugitive', 'readonly', 'filename', 'modified'] ],
            \   'right': [ [ 'lineinfo' ], ['percent'] ]
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
            \ },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
            \ },
            \ 'separator': { 'left': ' ', 'right': ' ' },
            \ 'subseparator': { 'left': ' ', 'right': ' ' }
            \ }

