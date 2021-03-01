# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

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
source /etc/zsh_command_not_found

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/.zsh/custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    fzf                         # CTRL+T to search files, CTRL+R to search zsh history
    safe-paste                  # prevent pasted code from running
    wakatime                    # coding metrics
    zsh-autosuggestions         # Autocomplete
    zsh-syntax-highlighting     # Fish-shell like syntax highlighting
)

source $ZSH/oh-my-zsh.sh
