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
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# system
alias rb="cd /mnt/c/Users/Rajit\ Banerjee"
alias ex="explorer.exe ."
alias sb="source ~/.bashrc"
alias open="xdg-open"
alias and="&&"
alias cd..="cd .."
alias sl="ls"
alias cdd="cd ~/.dotfiles"
alias ins="sudo apt-get install"
alias q="exit"

# git
alias ga="git add ."
alias gc="git commit -m"
alias gs="git status"
alias gp="git push"
alias gd="git diff"
alias gac="git add . && git commit -m"
alias gh="xdg-open https://github.com/rajitbanerjee"
alias ghr="xdg-open https://github.com/rajitbanerjee?tab=repositories"

# conda
alias cab="conda activate base"
alias cda="conda deactivate"