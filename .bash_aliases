# ~/.bash_aliases
# sourced by ~/.bashrc

# `al alias='command --args'` appends the defined alias to ~/.bash_aliases and also sets it
al() {
  local a
  for a; do
    alias "$a" &&
    alias "${a%%=*}" >> ~/.bash_aliases
  done
}

alias ls='ls -F --group-directories-first'
alias la='ls -AF --color --group-directories-first'
alias ll='ls -lh --group-directories-first'
alias lx='ls -X --color'
alias lp='ls -Al | more' # pipes through more because less can't handle the colourising

alias c='clear'
alias m='mutt'
alias x='startx'

alias sd='sudo shutdown -h now'
alias rs='sudo shutdown -r now'
alias ifup='sudo ifconfig eth0 up'
alias ifdown='sudo ifconfig eth0 down'
alias aptitude='sudo aptitude'
alias update-grub='sudo update-grub'
alias apt='sudo aptitude'

alias commit='git commit -a'
alias commitall='git add . && git commit && git push origin master'
alias checkout='git checkout'

alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'

alias chx='chmod +x'
alias nocomment='grep -Ev "^(#|$)"'
alias bc='bc -l'
alias path='echo -e ${PATH//:/\\n}'
alias df='df -h'
alias popular="cat .bash_history | awk '{ print \$1 }' | sort | uniq -c | sort -rn | less"
alias tetris='tetris-bsd'
alias mix='alsamixer'
alias mixer='alsamixer'
alias a='./a.out'

mank() { apropos "$@"; }
cc() { gcc "$@"; }
label() { echo -ne "\e]0;$1\a"; }

top () {
  if which htop; then
    htop
  else
    top
  fi
}

extract () {
  if [ -f "$1" ] ; then
      case "$1" in
          *.tar.bz2)   tar xvjf "$1"    ;;
          *.tar.gz)    tar xvzf "$1"    ;;
          *.tar.xz)    tar xfJ "$1"     ;;
          *.bz2)       bunzip2 "$1"     ;;
          *.rar)       rar x "$1"       ;;
          *.gz)        gunzip "$1"      ;;
          *.tar)       tar xvf "$1"     ;;
          *.xz)        unxz "$1"        ;;
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

rub() { 
  rubber "$@" && rm *.aux *.log;
  dvipdf *.dvi && rm *dvi;
}

alias srcf='label SRCF && ssh jk564@shell.srcf.net'
alias sdf='label SDF && ssh jk564@sdf.org'
alias twenex='label TWENEX && ssh twenex@sdf.org'
alias vms='label VMS && ssh jk564@jack.vistech.net'

alias ll='ls -lh'
alias ll='ls -lh --group-directories-firs'
alias ll='ls -lh --group-directories-first'
alias nao='telnet nethack.alt.org'
