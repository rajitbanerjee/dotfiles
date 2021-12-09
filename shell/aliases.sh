# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases


# system
alias ..="cd .."
alias cd..="cd .."
alias cdd="cd ~/.dotfiles"
alias chx="chmod +x"
alias cls="clear"
alias env="env | sort | less"
alias findf="find -type f -name"
alias jn="jupyter notebook"
alias l='ls -alFh'
alias la='ls -A'
alias ll='ls -alFh'
alias mv="mv -i"
alias n="nvim"
alias q="exit"
alias sl="ls"
alias vim="nvim"
if [[ "$(uname -s)" == "Linux" ]]; then
    alias doc="cd /mnt/c/Users/rajitbanerjee/Documents"
    alias dp="cd /mnt/c/Users/rajitbanerjee/Desktop"
    alias drive="xdg-open https://drive.google.com/drive/my-drive"
    alias ex="explorer.exe ."
    alias open="xdg-open"
    alias rb="/mnt/c/Users/rajitbanerjee"
    alias pj="cd ~/projects"
elif [[ "$(uname -s)" == "Darwin" ]]; then
    alias doc="cd ~/Documents"
    alias dp="cd ~/Desktop"
    alias pj="cd ~/Git/projects"
    alias notes="cd ~/Git/notes"
fi

# ucd stage 4 autumn
alias fyp="cd ~/Desktop/final-year-project"
alias cc="cd ~/Desktop/cloud-computing"
alias dm="cd ~/Desktop/data-mining"
alias dist="cd ~/Desktop/distributed-systems"
alias ml="cd ~/Desktop/machine-learning"
alias opt="cd ~/Desktop/optimisation"

# git
alias ga="git add"
alias gaa="git add --all"
alias gac="git add . && git commit -m"
alias gap="git add --all -p"
alias gc="git commit -m"
alias gcd="git checkout"
alias gd="git diff --color-words"
alias gds="git diff --staged --color-words"
alias gia="git status --porcelain | sed -n -e 's/^?? //p' >> .gitignore"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gp="git push"
alias gpl="git pull"
alias gpla="git-pull-all . -r"
alias gr="git restore"
alias grs="git restore --staged"
alias gs="git status"
alias gsu="git submodule update --init --recursive"
alias gsur="git submodule update --remote"
alias gu="git reset --soft HEAD~1"

# tmux
alias tl="tmux ls"
alias tn="tmux new -s"
alias tks="tmux kill-session -t"
alias tka="tmux kill-session -a"
alias ta="tmux attach-session -t"
alias td="tmux detach-client -s"
alias ts="tmux switch -t"

# code
alias codex="code --list-extensions"
alias codein="cat ~/.dotfiles/code/extensions.txt | xargs -L 1 echo code --install-extension"

# conda
alias cab="conda activate base"
alias cda="conda deactivate"
alias exp="conda env export --no-builds"

