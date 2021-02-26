set nocompatible              " be iMproved, required
filetype off                  " required


set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' 
Plugin 'amix/vim-zenroom2' 
Plugin 'amix/open_file_under_cursor.vim' 
Plugin 'Chiel92/vim-autoformat'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'dense-analysis/ale'
Plugin 'fatih/vim-go'
Plugin 'itchyny/lightline.vim' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plugin 'junegunn/fzf.vim' 
Plugin 'junegunn/goyo.vim' 
Plugin 'lervag/vimtex'
Plugin 'maxbrunsfeld/vim-yankstack' 
Plugin 'mhinz/vim-signify' 
Plugin 'morhetz/gruvbox' 
Plugin 'preservim/nerdtree'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

source $HOME/.vim/basic.vim
source $HOME/.vim/plugins_config.vim

