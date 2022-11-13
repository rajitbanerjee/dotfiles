export PATH=~/bin:/usr/local/bin:$PATH
export ZSH=~/.oh-my-zsh

ZSH_DISABLE_COMPFIX="true" # Skip verification of insecure directories (macOS error)
ENABLE_CORRECTION="true"
ZSH_CUSTOM=~/.zsh/custom

[[ ! -f ~/.zsh/optional.zsh ]] || source ~/.zsh/optional.zsh

plugins=(
    docker                      # Docker completion
    docker-compose
    fzf                         # CTRL+T to search files, CTRL+R to search zsh history
    safe-paste                  # prevent pasted code from running
    wakatime                    # coding metrics
    zsh-autosuggestions         # Autocomplete
    zsh-completions             # Additional completion definitions: https://github.com/zsh-users/zsh-completions/tree/master/src
    zsh-syntax-highlighting     # Fish-shell like syntax highlighting
)

source $ZSH/oh-my-zsh.sh

