# -*- sh -*-
setopt PROMPT_SUBST     # allow functions in the prompt

COLOR_OFF=%{$fg[default]%}
BLUE=%{$fg[blue]%}
GREEN=%{$fg[green]%}
RED=%{$fg[red]%}
YELLOW=%{$fg[yellow]%}

function ssh_hostname {
    local s=""
    if [ -z $SSH_CLIENT ]; then
        s+="$COLOR_OFF@%m"
    else
        s+="@$RED%m$COLOR_OFF"
    fi
    echo ${~~s}
}

function git_branch {
    git status >/dev/null 2>/dev/null && echo "$(git status)" | cut -d " " -f 3 | head -n 1
}

# if you have untracked files, show a red square; unstaged files, a
# yellow square; staged but uncommitted files, a green square.
# should also probably track the number of commits which have not yet
# been pushed upstream.
function git_status {
    local s=""
    if git status 2>/dev/null | grep -i "untracked" >/dev/null; then
        s+="$RED(untracked files)"
    fi
    if git status 2>/dev/null | grep -i "not staged" >/dev/null; then
        s+="$YELLOW(unstaged files)"
    fi
    if git status 2>/dev/null | grep -i "to be committed" >/dev/null; then
        s+="$GREEN(uncommitted files)"
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

PS1='$BLUE%n$(ssh_hostname):$GREEN%~ $YELLOW($(git_branch))
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
