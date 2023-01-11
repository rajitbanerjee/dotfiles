# system
alias ..="cd .."
alias cd..="cd .."
alias cdd="cd ~/.dotfiles"
alias chx="chmod +x"
alias cls="clear"
alias cl="cls && l"
alias env="env | sort | less"
alias path="tr ':' '\n' <<<"$PATH" | less"
alias q="exit"
case "$(uname)" in
Darwin)
	alias doc="cd ~/Documents"
	alias dp="cd ~/Desktop"
	alias dow="cd ~/Downloads"
	;;
Linux)
	alias open="xdg-open"
	;;
esac

# aws
alias wp="cd /workplace/brajit"
alias bb="brazil-build"
alias bbb="brazil-recursive-cmd brazil-build --all"

# files
alias less="less -R"
alias mv="mv -i"
alias sizer="du -h * | sort -hr | less"

# exa (a modern replacement for ls)
alias l='exa -l --icons -h --git --no-user'
alias la='l -a'
alias ll='ls -lh'
alias ls='exa'
alias lt='exa -T -L'
alias sl="ls"

# dev
alias n="nvim"
alias jn="jupyter notebook"
alias pip="pip3"

# git
alias ga="git add"
alias gaa="git add --all"
alias gac="git add . && git commit -m"
alias gap="git add --all -p"
alias gb="git branch"
alias gcm="git commit"
alias gca="git commit --amend"
alias gcd="git checkout"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gpl="git pull"
alias gpla="git-pull-all . -r"
alias gr="git restore"
alias grs="git restore --staged"
alias gs="git status"
alias gsa="find . -name .git -type d -execdir pwd \; -execdir git status \; -execdir echo \; -execdir echo \;"
alias gst='git stash -- $(git diff --staged --name-only)'
alias gsp="git stash pop"
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

# vs code
alias codex="code --list-extensions"
alias codein="cat ~/.dotfiles/config/vscode/extensions.txt | xargs -L 1 echo code --install-extension | bash"

# docker
alias dc="docker-compose"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# maven
alias mi="mvn install"
alias mci="mvn clean install"
