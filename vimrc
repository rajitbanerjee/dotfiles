set nocompatible              " be iMproved, required
filetype off                  " required

" Plugin system requirements
" 1. Ag search for fzf.vim:     
" `sudo apt-get install silversearcher-ag`
" 
" Syntax highlighting in search results:
" `wget https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_amd64.deb`
" `sudo dpkg -i bat_0.15.4_amd64.deb`
"                   
" 2. vim-prettier: `cd ~/.vim/bundle/vim-prettier && npm install`
" 3. YouCompleteMe: `cd ~/.vim/bundle/YouCompleteMe && ./install.py --all`
" 4. vim-wakatime: needs Python to be installed + API key in ~/.wakatime.cfg. 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' 
Plugin 'amix/vim-zenroom2' 
Plugin 'amix/open_file_under_cursor.vim' 
Plugin 'itchyny/lightline.vim' 
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } } 
Plugin 'junegunn/fzf.vim' 
Plugin 'junegunn/goyo.vim' 
Plugin 'maxbrunsfeld/vim-yankstack' 
Plugin 'mhinz/vim-signify' 
Plugin 'morhetz/gruvbox' 
Plugin 'preservim/nerdtree'
Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wakatime/vim-wakatime'
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

source ~/.vim/init.vim
source ~/.vim/plugins_config.vim

