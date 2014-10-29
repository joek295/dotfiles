# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Console colours
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P1DC322F" #red
    echo -en "\e]P2859900" #green
    echo -en "\e]PBB58900" #yellow
    echo -en "\e]P4268BD2" #blue
    echo -en "\e]P5D33682" #magenta
    echo -en "\e]P62AA198" #cyan
    clear #for background artifacting
fi

# set PS1:
# source ~/.ps1 because, like aliases and functions, this can get rather messy
if [ -f ~/.ps1 ]; then
    . ~/.ps1
else
    # if for some reason the PS1 is located in .bash_prompt
    if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
    else
        # if no defined PS1, then have a basic fall-back
        # no color or any other fancy things
        PS1="\u@\h:\w $ "
    fi
fi

# History Options
# Ignore lines beginning with a space for purposes of history
HISTCONTROL=ignorespace
# append to the history file, don't overwrite it
shopt -s histappend
# write history live, rather than when a shell exits...
PROMPT_COMMAND='history -a'
# for setting history length see HISTSIZE and HISTFILESIZE in bash (1)
HISTSIZE=1000
HISTFILESIZE=5000
HISTIGNORE=l[asl]:cd:x:exit

# set a path which is read when cd-ing. no need to specify absolute paths here
CDPATH='.:..:~:~/media/university/essays'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# source ~/.bash_aliases
# don't put aliases in .bashrc for ease of both reading and editing both files
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Completion should be enabled by default if available
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

# colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;42;30m' 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
