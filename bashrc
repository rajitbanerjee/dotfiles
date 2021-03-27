## Bash default settings
if [ -f ~/.bash/settings.bash ]; then
    . ~/.bash/settings.bash
fi

## Bash prompt
if [ -f ~/.bash/prompt.bash ]; then
    . ~/.bash/prompt.bash
fi

## Alias definitions
if [ -f ~/.shell/aliases.sh ]; then
    . ~/.shell/aliases.sh
fi

## Custom functions
if [ -f ~/.shell/functions.sh ]; then
    . ~/.shell/functions.sh
fi

## Exports and other external program settings
if [ -f ~/.shell/common.sh ]; then
    . ~/.shell/common.sh
fi

