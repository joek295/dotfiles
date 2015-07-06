# -*- sh -*-

function git_branch {
    git branch >/dev/null 2>/dev/null && echo "($(git branch))"
}

PS1='%{$fg[blue]%}%n%{$fg[default]%}@%m:%{$fg[green]%}%~ %{$fg[yellow]%}$(git_branch)
%{%(#~$fg[red]~$fg[default])%}%#%{$fg[default]%} '

# RPS1/2 should tell us the mode when in vi-mode
function zle-line-init zle-keymap-select {
    NORMAL_PROMPT="%{$fg[blue]%}NORMAL%{$reset_color%}"
    INSERT_PROMPT="%{$fg[red]%}INSERT%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$NORMAL_PROMPT}/(main|viins)/$INSERT_PROMPT}"
    RPS2=$RPS1
    zle reset-prompt
}
