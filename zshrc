# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## Oh My Zsh settings
[[ ! -f ~/.zsh/settings.zsh ]] || source ~/.zsh/settings.zsh

## Alias definitions
[[ ! -f ~/.shell/aliases.sh ]] || source ~/.shell/aliases.sh

## Exports and other external program settings
[[ ! -f ~/.shell/external.sh ]] || source ~/.shell/external.sh

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh