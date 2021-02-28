"""""""""""""""""""
" => Key Mappings
"""""""""""""""""""

" Pasting, saving, quitting
map <leader>pp :setlocal paste!<cr>
map <C-s> :w<cr>
nmap <leader>w :wq<cr>
nmap <leader>qq :q!<cr>
nmap <leader>qa :qa<cr>

" Moving around
map 0 ^
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map ; :
noremap ;; ;
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap 5 % 
nnoremap s /
inoremap qq <ESC>

" Buffers
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>h :bprevious<cr>


" Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
nnoremap <silent> <TAB> :tabnext<CR>
nnoremap <silent> <S-TAB> :tabprevious<CR>


" Disable highlights
map <silent> <leader><cr> :noh<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Resize splits
nnoremap <silent> <C-Up>    :resize -2<CR>
nnoremap <silent> <C-Down>  :resize +2<CR>
nnoremap <silent> <C-Left>  :vertical resize -2<CR>
nnoremap <silent> <C-Right> :vertical resize +2<CR>


" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>


""""""""""""""""""""
" => Terminal Mode
""""""""""""""""""""

:tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * setlocal nonumber norelativenumber

" ALT+{h,j,k,l} to navigate windows from any mode
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


""""""""""""""""""""
" => Visual Mode
""""""""""""""""""""

" Move selected lines up/down
xnoremap K :move '<-2<cr>gv-gv
xnoremap J :move '>+1<cr>gv-gv

" Maintain visual selection after tab indentation
vnoremap < <gv
vnoremap > >gv

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
