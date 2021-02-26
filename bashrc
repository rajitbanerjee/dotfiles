## Bash default settings
if [ -f "$HOME/.bash/settings.bash" ]; then
    . "$HOME/.bash/settings.bash"
fi

## Bash prompt
if [ -f "$HOME/.bash/prompt.bash" ]; then
    . "$HOME/.bash/prompt.bash"
fi

## Alias definitions
if [ -f "$HOME/.shell/aliases.sh" ]; then
    . "$HOME/.shell/aliases.sh"
fi

## Exports and other external program settings
if [ -f "$HOME/.shell/external.sh" ]; then
    . "$HOME/.shell/external.sh"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/banerjee/.local/share/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

