# Skip verification of insecure directories (macOS error)
ZSH_DISABLE_COMPFIX="true"

# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

[[ ! -f "$HOME/.zsh/optional.zsh" ]] || source "$HOME/.zsh/optional.zsh"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Apt package suggestions
if [[ "$(uname -s)" == "Linux" ]]; then
    source /etc/zsh_command_not_found
fi

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.zsh/custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker                      # Docker completion
    docker-compose
    fzf                         # CTRL+T to search files, CTRL+R to search zsh history
    safe-paste                  # prevent pasted code from running
    wakatime                    # coding metrics
    zsh-autosuggestions         # Autocomplete
    zsh-syntax-highlighting     # Fish-shell like syntax highlighting
)

source $ZSH/oh-my-zsh.sh

if [[ "$(uname -s)" == "Linux" ]]; then
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/banerjee/.local/share/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/banerjee/.local/share/conda/etc/profile.d/conda.sh" ]; then
            . "/home/banerjee/.local/share/conda/etc/profile.d/conda.sh"
        else
            export PATH="/home/banerjee/.local/share/conda/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
fi
