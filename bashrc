# Bash prompt settings
if [ -f ~/.bash/prompt.bash ]; then
    . ~/.bash/prompt.bash
fi

# Alias definitions
if [ -f ~/.shell/aliases.sh ]; then
    . ~/.shell/aliases.sh
fi

# Exports and other external program settings
if [ -f ~/.shell/external.sh ]; then
    . ~/.shell/external.sh
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

