# -*- sh -*-

COLOR_OFF=%{$fg[default]%}
BLUE=%{$fg[blue]%}
GREEN=%{$fg[green]%}
RED=%{$fg[red]%}
YELLOW=%{$fg[yellow]%}

function git_branch {
    git branch >/dev/null 2>/dev/null && echo "($(git branch))"
}

function git_status {
    if git status 2>/dev/null | grep -i "untracked" >/dev/null; then
        echo "$RED*"
    fi
    if git status 2>/dev/null | grep -i "not staged" >/dev/null; then
        echo "$YELLOW*"
    fi
}

function prompt_char {
    if [[ $(whoami) == "root" ]]; then
        echo "$RED#$COLOR_OFF " && return
    else
        echo "$COLOR_OFF$ " && return
    fi
}

PS1='$BLUE%n$COLOR_OFF@%m:$GREEN%~ $YELLOW$(git_branch)
$(prompt_char)'

# RPS1/2 should tell us the mode when in vi-mode
function zle-line-init zle-keymap-select {
    NORMAL_PROMPT="%{$fg[blue]%}NORMAL%{$reset_color%}"
    INSERT_PROMPT="%{$fg[red]%}INSERT%{$reset_color%}"
    GIT_PROMPT="$(git_status)"
    RPS1="$GIT_PROMPT %{$reset_color%}[ ${${KEYMAP/vicmd/$NORMAL_PROMPT}/(main|viins)/$INSERT_PROMPT} ]"
    RPS2=$RPS1
    zle reset-prompt
}
