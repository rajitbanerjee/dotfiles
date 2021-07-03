set history=500
set updatetime=50
set autochdir " Change working dir on opening a file
set nobackup
set nowb
set noswapfile
set langmenu=en

let $LANG='en'

set so=7 " 7 lines for the cursor when moving up/down
set cmdheight=1
set hid " Buffer is hidden when abandoned
set number
set noshowcmd
set noshowmode
set splitbelow
set splitright
set mouse=a " Mouse support if ever needed
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

" WSL yank to windows clipboard (yank from windows still not working)
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system('cat |' . s:clip, @0) | endif
    augroup END
endif

" macOS system clipboard
set clipboard=unnamedplus

" Brackets
set showmatch
set mat=2

" Avoid error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Character limit per line
au BufNewFile,BufRead *.py set colorcolumn=80
au BufNewFile,BufRead *.go set colorcolumn=100

" Use spaces not tabs
set expandtab
set shiftwidth=4
set tabstop=4
" Reduce tab length for certain file types
au BufNewFile,BufRead *.html,*.css,*.js,*.ts setlocal shiftwidth=2 tabstop=2


" Linebreak on 500 characters
set lbr
set tw=500

" Line indent and wrapping
set si
set wrap

" Specify the behaviour when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable directory listing netrw
augroup goodbye_netrw
    au!
    autocmd VimEnter * silent! au! FileExplorer *
augroup END

