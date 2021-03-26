# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r "$HOME/.dircolors" && eval "$(dircolors -b $HOME/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -alFh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# system
alias ..="cd .."
alias cd..="cd .."
alias cdd="cd $HOME/.dotfiles"
alias cls="clear"
alias env="env | sort | less"
alias findf="find -type f -name"
alias jn="jupyter notebook"
alias mv="mv -i"
alias n="nvim ."
alias q="exit"
alias sb="source $HOME/.bashrc"
alias sl="ls"
alias vim="nvim"
if [[ "$(uname -s)" == "Linux" ]]; then
    alias doc="cd /mnt/c/Users/rajitbanerjee/Documents"
    alias dp="cd /mnt/c/Users/rajitbanerjee/Desktop"
    alias drive="xdg-open https://drive.google.com/drive/my-drive"
    alias ex="explorer.exe ."
    alias open="xdg-open"
    alias rb="/mnt/c/Users/rajitbanerjee"
elif [[ "$(uname -s)" == "Darwin" ]]; then
    alias doc="cd $HOME/Documents"
    alias dp="cd $HOME/Desktop"
fi


# git
alias ga="git add"
alias gaa="git add --all"
alias gc="git commit -m"
alias gs="git status"
alias gp="git push"
alias gpl="git pull"
alias gd="git diff --color-words"
alias gds="git diff --staged"
alias gac="git add . && git commit -m"
alias gr="git restore"
alias grs="git restore --staged"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gsu="git submodule update --init --recursive"
alias gsur="git submodule update --remote"
alias gu="git reset --soft HEAD~1"
alias gia="git status --porcelain | sed -n -e 's/^?? //p' >> .gitignore"
if [[ "$(uname -s)" == "Linux" ]]; then
    alias ghr="xdg-open https://github.com/rajitbanerjee?tab=repositories"
fi


# tmux
alias tl="tmux ls"
alias tn="tmux new -s"
alias tks="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias ta="tmux attach-session -t"
alias ts="tmux switch -t"

# conda
alias cab="conda activate base"
alias cda="conda deactivate"
alias can="conda activate net-analysis"
alias exp="conda env export --no-builds"

