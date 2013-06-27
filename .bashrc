# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (package: bash-doc) for examples

# add ~/scripts to PATH
PATH=$PATH:/home/joe/scripts

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# {{{ Console colours
if [ "$TERM" = "linux" ]; then
    #echo -en "\e]P0549088" #background gaia
    #echo -en "\e]P8073642" #darkgrey
    #echo -en "\e]P1DC322F" #darkred
    echo -en "\e]P1DC322F" #red
    #echo -en "\e]P293C724" #darkgreen
    echo -en "\e]P2859900" #green
    #echo -en "\e]P3FFA905" #brown
    echo -en "\e]PBB58900" #yellow
    #echo -en "\e]P400335D" #darkblue
    echo -en "\e]P4268BD2" #blue
    #echo -en "\e]P5ED2087" #darkmagenta
    echo -en "\e]P5D33682" #magenta
    #echo -en "\e]P6605D5D" #darkcyan
    echo -en "\e]P62AA198" #cyan
    #echo -en "\e]P7F2F1F0" #lightgrey
    #echo -en "\e]PFF9F9F9" #white
    clear #for background artifacting
fi
# }}}

# {{{ set PS1:
# Define color variables
Color_Off='\[\033[0m\]'         # Text Reset

# Regular Colors
Black='\[\033[0;30m\]'    # Black
Red='\[\033[0;31m\]'      # Red
Green='\[\033[0;32m\]'    # Green
Yellow='\[\033[0;33m\]'   # Yellow
Blue='\[\033[0;34m\]'     # Blue
Purple='\[\033[0;35m\]'   # Purple
Cyan='\[\033[0;36m\]'     # Cyan
White='\[\033[0;37m\]'    # White

# Bold
BBlack='\[\033[1;30m\]'   # Black
BRed='\[\033[1;31m\]'     # Red
BGreen='\[\033[1;32m\]'   # Green
BYellow='\[\033[1;33m\]'  # Yellow
BBlue='\[\033[1;34m\]'    # Blue
BPurple='\[\033[1;35m\]'  # Purple
BCyan='\[\033[1;36m\]'    # Cyan
BWhite='\[\033[1;37m\]'   # White

PS1="${Red}\u${Blue}@\h${Color_Off}:${Green}\w\n ${Color_Off}$ "
# }}}

# {{{ History Options
# don't put duplicate lines in the history. See bash(1) for more options
# also force ignorespace
HISTCONTROL=ignoredups
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash (1)
HISTSIZE=1000
HISTFILESIZE=2000
# }}}

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

# {{{ Functions
extract () {
  if [ -f "$1" ] ; then
      case "$1" in
          *.tar.bz2)   tar xvjf "$1"    ;;
          *.tar.gz)    tar xvzf "$1"    ;;
          *.bz2)       bunzip2 "$1"     ;;
          *.rar)       rar x "$1"       ;;
          *.gz)        gunzip "$1"      ;;
          *.tar)       tar xvf "$1"     ;;
          *.tbz2)      tar xvjf "$1"    ;;
          *.tgz)       tar xvzf "$1"    ;;
          *.zip)       unzip "$1"       ;;
          *.Z)         uncompress "$1"  ;;
          *.7z)        7z x "$1"        ;;
          *.cbr)       rar x "$1"       ;;
          *.cbz)       unzip "$1"       ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

mkcd() { mkdir -p "$@" && cd $_; }

rub() { rubber $1 && rm *.aux *.log;
  dvipdf *.dvi && rm *dvi;
}

# }}}

# Alias definitions can go in ~/.bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# {{{ Programmable Completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
# }}}

# {{{ colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
# }}}
