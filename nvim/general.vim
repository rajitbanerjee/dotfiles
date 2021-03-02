"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500
set updatetime=50
set autochdir " Change working dir on opening a file
set nobackup
set nowb
set noswapfile
set langmenu=en

let $LANG='en'
let mapleader = " "

set so=7 " 7 lines for the cursor when moving up/down
set cmdheight=1
set hid " Buffer is hidden when abandoned
set number
set relativenumber
set noshowcmd
set noshowmode
set splitbelow
set splitright
set mouse=a " Mouse support if ever needed

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

" Brackets
set showmatch
set mat=2

" Avoid error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" Python settings
" let python_highlight_all = 1
" au FileType python syn keyword pythonDecorator True None False self
" au FileType python map <buffer> F :set foldmethod=indent<cr>

" Character limit per line
au BufNewFile,BufRead *.py set colorcolumn=80
au BufNewFile,BufRead *.go set colorcolumn=100

" Use spaces not tabs
set expandtab
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Line indent and wrapping
set si
set wrap

" Specify the behavior when switching between buffers
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


" Terminal toggle (very cool!)
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
