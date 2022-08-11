""""""""""""""""""""""""""""""
" => Key Mappings
""""""""""""""""""""""""""""""
let mapleader = " "

" Pasting, saving, quitting
nnoremap <silent> <leader>pp :setlocal paste!<CR>
nnoremap <leader>w :wq<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>qa :qa<CR>

" Convenience
nnoremap 0 ^
nnoremap ; :
nnoremap u :u<CR>
nnoremap r <C-r>
nnoremap s :%s/
nnoremap Y y$
nnoremap <silent> <leader>1 :source ~/.config/nvim/init.vim \| :PlugClean<CR> \| :PlugInstall<CR> \| :PlugUpdate<CR>
nnoremap <silent> <leader><CR> :noh<CR>
inoremap qq <ESC>

" Undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u

" Keeping it centered
nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv

" Moving around
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
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
nnoremap q :Bclose<CR>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
" Delete buffer without closing window
command! Bclose call <SID>BufcloseCloseIt()
fun! <SID>BufcloseCloseIt()
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
endfun

" Quickfix
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <C-q> :call ToggleQFList()<CR>
let g:the_primeagen_qf_g = 0
fun! ToggleQFList()
    if g:the_primeagen_qf_g == 1
        let g:the_primeagen_qf_g = 0
        cclose
    else
        let g:the_primeagen_qf_g = 1
        copen
    end
endfun


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
