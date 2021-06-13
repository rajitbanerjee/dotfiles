" Neovim Configurations

source ~/.config/nvim/general.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

try
  " Note: manually change colorscheme for lightline.vim
  set background=dark
  colorscheme gruvbox
  " set background=light
  " colorscheme PaperColor
catch
endtry

