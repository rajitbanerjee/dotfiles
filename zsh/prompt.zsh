source ~/.shell/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# %B (%b): Start (stop) boldface
# %F (%f): Start (stop) using a different foreground colour, if supported by the terminal
# %(5~|%-1~/…/%3~|%4~): Prompt dir. trimming
setopt PROMPT_SUBST ; PS1='%B%F{100}%(5~|%-1~/…/%3~|%4~)%f%b %F{66}$(__git_ps1 "(%s)") \$ '

