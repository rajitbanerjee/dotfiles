" Neovim Configurations

"""""""""""""""""""""""""""""""""""
" => General Settings
""""""""""""""""""""""""""""""""""

let $LANG='en'
set langmenu=en
set history=500 updatetime=50
set signcolumn=yes
set nobackup nowritebackup noswapfile
set scrolloff=7 " 7 lines for the cursor when moving up/down
set cmdheight=1
set hid " Buffer is hidden when abandoned
set number 
set noshowcmd noshowmode 
set splitbelow splitright 
set termguicolors background=dark
set mouse=a

syntax enable
set ffs=unix,dos,mac
set whichwrap+=<,>,h,l
set smartcase
set lazyredraw " Don't redraw when executing macros
set magic " Simplify regex
set inccommand=split " Live substition 
set clipboard=unnamedplus " MacOS system clipboard
set showmatch mat=2
set noerrorbells novisualbell t_vb= tm=500
set linebreak tw=500 " Line break at 500 characters
set wrap foldlevelstart=99
set autoindent smartindent
set expandtab tabstop=4 shiftwidth=4 " Use spaces (width 4) instead of tab
set list listchars=tab:»\ ,lead:·,trail:.

filetype plugin indent on

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable directory listing netrw
augroup goodbye_netrw
    au!
    autocmd VimEnter * silent! au! FileExplorer *
augroup END

" Yank over SSH
function Copy()
  let c = join(v:event.regcontents,"\n")
  let c64 = system("base64", c)
  let s = "\e]52;c;" . trim(c64) . "\x07"
  call chansend(v:stderr, s)
endfunction
autocmd TextYankPost * call Copy()

" Persist undo after buffer close 
if has('persistent_undo')
    let target_path = expand('~/.config/vim-persisted-undo/') 
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    let &undodir = target_path
    set undofile
endif

" AWS
au BufReadPost,BufNewFile Config setf brazil-config


""""""""""""""""""""""""""""""""""
" => Key Mappings: Normal/Insert
""""""""""""""""""""""""""""""""""
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
" Close buffer -> close tab -> suppress error 'Cannot close last tab page'
nnoremap <silent> q :Bclose<CR> :silent! tabclose<CR> 
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
command! ClearQFList cexpr []
nnoremap <leader>cc :ClearQFList<CR> :cclose<CR>
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


""""""""""""""""""""""""""""""""""
" => Key Mappings: Terminal
""""""""""""""""""""""""""""""""""
tnoremap <C-q> <C-\><C-n>

""""""""""""""""""""""""""""""""""
" => Key Mappings: Visual
""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plugins.vim
