# -*- sh -*-

function git_branch {
    git branch >/dev/null 2>/dev/null && echo "($(git branch))"
}

function prompt_char {
    if [[ $(whoami) == "root" ]]; then
        echo "$RED#$COLOR_OFF " && return
    else
        echo "$COLOR_OFF$ " && return
    fi
}

COLOR_OFF=%{$fg[default]%}
BLUE=%{$fg[blue]%}
RED=%{$fg[red]%}
YELLOW=%{$fg[yellow]%}
GREEN=%{$fg[green]%}

PS1='$BLUE%n$COLOR_OFF@%m:$GREEN%~ $YELLOW$(git_branch)
$(prompt_char)'

# RPS1/2 should tell us the mode when in vi-mode
function zle-line-init zle-keymap-select {
    NORMAL_PROMPT="%{$fg[blue]%}NORMAL%{$reset_color%}"
    INSERT_PROMPT="%{$fg[red]%}INSERT%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$NORMAL_PROMPT}/(main|viins)/$INSERT_PROMPT}"
    RPS2=$RPS1
    zle reset-prompt
}
