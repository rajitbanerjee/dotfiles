## Default editor
export EDITOR=nvim

## Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

## Add custom scripts + installed scripts to path
export PATH=~/.local/scripts/bin:$PATH
export PATH=~/.local/bin:$PATH

## man
export MANPAGER='nvim +Man!'
export MANWIDTH=999

## Fix SSL verification errors
export SSL_CERT_FILE=/etc/ssl/cert.pem

## nvim sessions (https://github.com/tpope/vim-obsession)
export NVIM_SESSIONS=~/.cache/nvim/

## Conda
__conda_setup="$(~/.local/share/conda/bin/conda shell."$0" hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f ~/.local/share/conda/etc/profile.d/conda.sh ]; then
        . ~/.local/share/conda/etc/profile.d/conda.sh
    else
        export PATH=~/.local/share/conda/bin:$PATH
    fi
fi
unset __conda_setup

