if [ "$TMUX" = "" ]; then tmux; fi

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

## Custom functions
[[ ! -f ~/.shell/functions.sh ]] || source ~/.shell/functions.sh

## Exports and other external program settings
[[ ! -f ~/.shell/common.sh ]] || source ~/.shell/common.sh

## AWS Work Stuff
[[ ! -f ~/.shell/aws.sh ]] || source ~/.shell/aws.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Reload completions (for zsh-completions)
autoload -U compinit && compinit
