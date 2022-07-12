if [ -n "$SSH_CLIENT" ]; then
    ssh_flag="(ssh) "
fi

PS1='\[\033[01;32m\]${ssh_flag}\u@\h:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)")\$ '

PROMPT_DIRTRIM=3

## Git Prompt
if [ -f ~/.shell/git-prompt.sh ]; then
	. ~/.shell/git-prompt.sh
fi

## unstaged (!) and staged (+) changes
GIT_PS1_SHOWDIRTYSTATE=1
## If something is stashed, then a '*' will be shown
GIT_PS1_SHOWSTASHSTATE=1
## If there are untracked files, then a '%' will be shown
GIT_PS1_SHOWUNTRACKEDFILES=1
##  A "<" indicates you are behind, ">" indicates you are ahead,
# "<>" indicates you have diverged and "=" indicates that there is no difference
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1
