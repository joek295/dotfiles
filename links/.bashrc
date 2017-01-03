# ~/.bashrc is executed by bash(1) for non-login shells.
# login shells instead execute (in order of preference):
# .bash_profile, .bash_login, .profile
# however in most instances these files source .bashrc if $SHELL is bash

LANG=C

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

DOTFILES=$HOME/dotfiles
ALIASES=$DOTFILES/sh.d/aliases
FUNCTIONS=$DOTFILES/sh.d/functions
PROMPT=$DOTFILES/bash.d/prompt

# set PS1:
# Prompt is defined in a separate file because it can be rather complex
if [ -f $PROMPT ]; then
    source $PROMPT
else
    # fallback prompt, if the $PROMPT file doesn't exist...
    PS1="\u@\h:\w $ "
fi

# History Options
shopt -s histappend # append to the history file, don't overwrite it
shopt -s cmdhist # multiple line commands should be in a single line of history
# Ignore lines beginning with a space for purposes of history
HISTCONTROL=ignorespace
# write history live, rather than when a shell exits...
PROMPT_COMMAND='history -a'
# for setting history length see HISTSIZE and HISTFILESIZE in bash (1)
HISTSIZE=1000
HISTFILESIZE=5000
HISTIGNORE=l[asl]:cd:x:exit:man:sd:rs:telnet:ssh

# set a path which is read when cd-ing. no need to specify absolute paths here
CDPATH='.:..:~:~/media/university/essays'

shopt -s checkwinsize # update window size after every command
shopt -s autocd # typing a directory name should cd to that directory
shopt -s globstar # allow the /dir/**/file syntax

# source aliases and functions:
if [ -f $ALIASES ]; then
     source $ALIASES
fi
if [ -f $FUNCTIONS ]; then
    source $FUNCTIONS
fi

# Completion should be enabled by default if available
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi
