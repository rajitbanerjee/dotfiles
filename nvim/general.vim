set history=500 updatetime=50
set signcolumn=yes
set nobackup nowritebackup noswapfile
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
set mouse=a
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
set ignorecase smartcase
set lazyredraw " Don't redraw when executing macros
set magic " Simplify regex
set inccommand=split " Live substition 
set clipboard=unnamedplus " MacOS system clipboard
set showmatch mat=2
set noerrorbells novisualbell t_vb= tm=500
set autoindent noexpandtab tabstop=4 shiftwidth=4 " Use tabs (width 4) instead of spaces
set lbr tw=500 " Line break at 500 characters
set si wrap foldlevelstart=99

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
