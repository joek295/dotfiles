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

ALIASES=$HOME/.aliases
FUNCTIONS=$HOME/.functions
PROMPT=$HOME/.bash_prompt

# set PS1:
# source a different file, because like aliases and functions, this can get 
# rather messy
# look in .ps1 and .bash_prompt for configurations
# .bash_prompt should be preferred, in case other shells with incompatible
# ps1 syntaxes want to look in .ps1
if [ -f $PROMPT ]; then
    . $PROMPT
else
    # if no defined PS1, then have a basic fall-back
    # no color or any other fancy things
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

# source aliases

if [ -f $ALIASES ]; then
     . $ALIASES
fi

# source ~.bash_functions

if [ -f $FUNCTIONS ]; then
    . $FUNCTIONS
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
