"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Start NERDTree only when I start vim without file arguments
autocmd VimEnter * if !argc() | NERDTree | endif


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to definition
nnoremap <silent> <leader>jd :YcmCompleter GoTo<cr>