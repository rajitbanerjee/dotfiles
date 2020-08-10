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
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -alFh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# system
alias rb="cd /mnt/c/Users/rajitbanerjee"
alias ex="explorer.exe ."
alias sb="source ~/.bashrc"
alias open="xdg-open"
alias and="&&"
alias cd..="cd .."
alias ..="cd .."
alias sl="ls"
alias cdd="cd ~/.dotfiles"
alias ins="sudo apt-get install"
alias q="exit"
alias mv="mv -i"
alias v="vim"
alias drive="xdg-open https://drive.google.com/drive/my-drive"

# git
alias ga="git add ."
alias gc="git commit -m"
alias gs="git status"
alias gp="git push"
alias gd="git diff"
alias gds="git diff --staged"
alias gac="git add . && git commit -m"
alias gr="git restore"
alias grs="git restore --staged"
alias gl="git lg"
alias gh="xdg-open https://github.com/rajitbanerjee"
alias ghr="xdg-open https://github.com/rajitbanerjee?tab=repositories"
alias gsu="git submodule update --init --recursive"

# conda
alias cab="conda activate base"
alias cda="conda deactivate"
