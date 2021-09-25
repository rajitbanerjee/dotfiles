""""""""""""""""""""""""""""""
" => Key Mappings
""""""""""""""""""""""""""""""
let mapleader = " "

" Pasting, saving, quitting
map <silent> <leader>pp :setlocal paste!<CR>
map <C-s> :w<CR>
nmap <leader>w :wq<CR>
nmap <leader>qq :q!<CR>
nmap <leader>qa :qa<CR>

" Convenience
map 0 ^
map ; :
noremap ;; ;
nnoremap u <C-r>
nnoremap r :%s/
nnoremap s /
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugClean<CR> \| :PlugInstall<CR> \| :PlugUpdate<CR>
map <silent> <leader><CR> :noh<CR>
inoremap qq <ESC>
inoremap <C-q> <ESC>

" Cycle through popup suggestions with TAB; Enter to select and suppress new line
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" Moving around
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" Resize splits
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>

" Buffers
map <leader>q :Bclose<CR>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Delete buffer without closing window
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif
    if bufnr("%") == l:currentBufNum
        new
    endif
    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction


""""""""""""""""""""""""""""""
" => Terminal Mode
""""""""""""""""""""""""""""""
:tnoremap <C-q> <C-\><C-n>


""""""""""""""""""""""""""""""
" => Visual Mode
""""""""""""""""""""""""""""""
" Move selected lines up/down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Maintain visual selection after tab indentation
vnoremap < <gv
vnoremap > >gv

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction
