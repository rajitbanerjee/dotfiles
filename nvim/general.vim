set history=500
set updatetime=50
set signcolumn=yes
set nobackup
set nowritebackup
set noswapfile
set langmenu=en

let $LANG='en'

set scrolloff=7 " 7 lines for the cursor when moving up/down
set cmdheight=1
set hid " Buffer is hidden when abandoned
set number
set noshowcmd
set noshowmode
set splitbelow
set splitright
set mouse=i
set termguicolors

set background=dark
command! BackgroundToggle call <SID>BackgroundToggle()
function! <SID>BackgroundToggle()
    if &background == "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

syntax enable
set ffs=unix,dos,mac
set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set lazyredraw " Don't redraw when executing macros
set magic " Simplify regex
set inccommand=split " Live substition 

" macOS system clipboard
set clipboard=unnamedplus

" Brackets
set showmatch
set mat=2

" Disable error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Filetype settings
au BufNewFile,BufRead *.js,*.ts,*.jsx,*.tsx set colorcolumn=120
au BufNewFile,BufRead *.py set colorcolumn=80
au BufNewFile,BufRead *.http set ft=rest
" Use spaces not tabs
set expandtab
set shiftwidth=4
set tabstop=4
" Reduce tab length for certain file types
au BufNewFile,BufRead *.html,*.css,*.js,*.ts,*.jsx,*.tsx,*.lua setlocal shiftwidth=2 tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

" Line indent, wrapping, folding
set si
set wrap
set foldlevelstart=99

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable directory listing netrw
augroup goodbye_netrw
    au!
    autocmd VimEnter * silent! au! FileExplorer *
augroup END

