" Plugin Settings

" auto install vim-plug and plugins
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

Plug 'amix/vim-zenroom2'                              " Markdown editing in zen mode 
Plug 'dbakker/vim-projectroot'                        " Allows FZF to search in project root
Plug 'dense-analysis/ale'                             " LSP, linting, formatting
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }   " Go support
Plug 'iamcco/markdown-preview.nvim', {
  \ 'do': { -> mkdp#util#install()  },
  \ 'for': ['markdown', 'vim-plug']
  \ }                                                 " Markdown preview
Plug 'itchyny/lightline.vim'                          " Status bar
Plug 'jiangmiao/auto-pairs'                           " Bracket matching
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}     " Fuzzy finder
Plug 'junegunn/fzf.vim'                               
Plug 'junegunn/goyo.vim'                              " Zen mode
Plug 'lervag/vimtex'                                  " LaTeX support
Plug 'maxbrunsfeld/vim-yankstack'                     " Turns default register into a stack
Plug 'mengelbrecht/lightline-bufferline'              " Buffers instead of tabs on top
Plug 'mhinz/vim-signify'                              " Git changes shown in column
Plug 'mhinz/vim-startify'                             " Start screen
Plug 'morhetz/gruvbox'                                " Colour scheme
Plug 'neoclide/coc.nvim', {'branch': 'release'}       " Code completion (WARN: Latest stable node version required)
Plug 'ryanoasis/vim-devicons'                         " File type icons
Plug 'sheerun/vim-polyglot'                           " Syntax highlighting/language pack
Plug 'tpope/vim-commentary'                           " Code commenting
Plug 'tpope/vim-fugitive'                             " Git wrapper
Plug 'tpope/vim-surround'                             " Delete, change, add surroundings
Plug 'wakatime/vim-wakatime'                          " Coding metrics
Plug 'yuttie/comfortable-motion.vim'                  " Smooth scrolling

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

" Find errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
" => itchyny/lightline.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ ['mode', 'paste'],
            \             ['fugitive', 'readonly', 'filename', 'modified'] ],
            \   'right': [ [ 'lineinfo' ], ['percent'] ]
            \ },
            \ 'component_function': {
            \   'filename': 'LightlineFilename'
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
            \ },
            \ 'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
            \ 'component_type': { 'buffers': 'tabsel' },
            \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
            \ },
            \ 'separator': { 'left': ' ', 'right': ' ' },
            \ 'subseparator': { 'left': ' ', 'right': ' ' },
            \ 'tabline': {
            \   'left': [ ['buffers'] ],
            \   'right': [ ['close'] ]
            \ }
            \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has('popupwin')
    let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
    let $FZF_DEFAULT_OPTS='--reverse'
endif
map <leader>f :ProjectRootExe FZF<CR>
map <leader>g :ProjectRootExe Rg<CR>
map <leader>b :Buffers<CR>


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
nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<CR>
nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<CR>
nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  :<C-u>CocFix<CR>
nmap <leader>r <Plug>(coc-rename)

" Start explorer automatically
" autocmd User CocNvimInit :CocCommand explorer


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>d :Gvdiffsplit<CR>
map <leader>s :GFiles?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => yuttie/comfortable-motion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <leader>j :call comfortable_motion#flick(150)<CR>
nnoremap <silent> <leader>k :call comfortable_motion#flick(-150)<CR>


