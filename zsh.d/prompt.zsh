# -*- sh -*-

COLOR_OFF=%{$fg[default]%}
BLUE=%{$fg[blue]%}
GREEN=%{$fg[green]%}
RED=%{$fg[red]%}
YELLOW=%{$fg[yellow]%}

function git_branch {
    git branch >/dev/null 2>/dev/null && echo -n "(" && echo "$(git branch) )" | cut -c 2-
}

function git_status {
    local s=""
    if git status 2>/dev/null | grep -i "untracked" >/dev/null; then
        s+="$RED⊛"
    fi
    if git status 2>/dev/null | grep -i "not staged" >/dev/null; then
        s+="$YELLOW⊛"
    fi
    if git status 2>/dev/null | grep -i "to be committed" >/dev/null; then
        s+="$GREEN⊛"
    fi
    s+="$COLOR_OFF"
    echo ${~~s}
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

NORMAL_PROMPT="$BLUE NORMAL$COLOR_OFF"
INSERT_PROMPT="$RED INSERT$COLOR_OFF"
# RPS1/2 should tell us the mode when in vi-mode
function zle-line-init zle-keymap-select {
    GIT_PROMPT="$(git_status)"
    RPS1="$GIT_PROMPT [${${KEYMAP/vicmd/$NORMAL_PROMPT}/(main|viins)/$INSERT_PROMPT} ]"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
