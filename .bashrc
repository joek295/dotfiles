# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (package: bash-doc) for examples

# add ~/scripts to PATH
PATH=$PATH:/home/joe/scripts

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# set PS1:
PS1="\[\033[0m\]\[\033[1;31m\]\u\[\033[0m\]\[\033[34m\]@\h\[\033[0m\]:\[\033[32m\]\w\[\033[0m\]\$ "

# don't put duplicate lines in the history. See bash(1) for more options
# also force ignorespace
HISTCONTROL=ignoredups
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash (1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# some aliases
# command shortening
alias sd='sudo shutdown -h now'
alias rs='sudo shutdown -r now'
alias x=startx
alias cell=/home/joe/bin/freecell-1.0/src/freecell
alias tetris=tetris-bsd
alias apt='sudo aptitude'
# with ls
alias ls='ls -F --color --group-directories-first'
alias la='ls -AF --color --group-directories-first'
alias ll='ls -l'
# internet connection
alias ifup='sudo ifconfig eth0 up'
alias ifdown='sudo ifconfig eth0 down'
# I always forget sudo with these
alias aptitude='sudo aptitude'
alias update-grub='sudo update-grub'
# Vim is the only true text editor
alias nano=vim
alias pico=vim
alias emacs=vim
alias notepad=vimtutor
# Misc
alias commitall='git add . && git commit'
alias cdd='cd /home/Joe/documents/schoolwork/essays'

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

# Alias definitions can go in ~/.bash_aliases

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features 
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
