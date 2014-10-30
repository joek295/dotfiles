# -*- sh -*-
# sourced by ~/.bashrc
# functions for bash are defined in this file.
# man bash has this to say about aliases and functions:
#
#     There is no mechanism for using arguments in the replacement text.  If arguments are needed, a shell function should be used.
#     ...
#     For almost every purpose, aliases are superseded by shell functions.

# `al alias='command --args'` appends the defined alias to ~/.bash_aliases
# and also sets it in the current session
al() {
  local a
  for a; do
    alias "$a" && alias "${a%%=*}" >> ~/.bash_aliases
  done
}

# some one-liners
cc() { gcc "$@"; }
emacs() { emacsclient -nw -a ""; } # I use emacsdaemon/emacsclient rather than plain emacs
label() { echo -ne "\e]0;$1\a"; } # labels the terminal for easily seeing which has which session
path() { echo $PATH | sed s/:/\\n/g; } # easy-to-read $PATH
popular() { awk '{ print $1 }' ~/.bash_history | sort | uniq -c | sort -rn | less; }
#cd() { command cd "$@" && clear; }
cdll() { cd "$@" && clear && ls -l --group-directories-first; }
mkcd() { mkdir -p "$@" && cd $_; }
rem() { pkill emacs && command emacs --daemon && emacsclient -nw; }
edi() { pkill emacs && command emacs --debug-init; }

# prefer more modern versions of standard applications
htop() {
  if which htop > /dev/null; then
    command htop
  else
    command top
  fi
}
vim() {
  if which vim > /dev/null; then
    command vim
  else
    command vi
  fi
}
top() {
  if which htop > /dev/null; then
    command htop
  else
    command top
  fi
}
vi() {
  if which vim > /dev/null; then
    command vim
  else
    command vi
  fi
}

# handy uncompression function
# intelligently uncompresses files with extensions from various compression algorithms
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
      echo "Either $1 is not an archive file, or it is in a format which extract is not familiar with."
  fi
}

# pack is like extract in reverse...
pack () {
  if [ $# -lt 2 ]; then
    echo -e "\npack usage:"
    echo -e "\tpack archive_name file1 file2 ... fileN"
    echo -e "\tpack creates archive of files\n"
    echo -e "file types supported:"
    echo -e "\t .tar.bz2; .tar.gz; .tgz; .zip; .xpi; .7z\n"
  else
    DEST=$1
    shift

    case $DEST in
      *.tar.bz2) tar -cvjf $DEST "$@" ;;
      *.tar.gz) tar -cvzf $DEST "$@" ;;
      *.tgz) tar -cvzf $DEST "$@" ;;
      *.zip) zip -r $DEST "$@" ;;
      *) echo "Unknown file type - $DEST" ;;
    esac
  fi
}

# mtoc prints a table of contents for a man page
# handy for stupidly long pages like bash and fvwm
mtoc() { man --ascii "$1" 2>/dev/null | awk '
            BEGIN { a[""]++ }
            /^\s{0,4}\S/ && !($0 in a) { a[$0]++ ; b[i++]=$0 }
            END { for (j=0 ; j<i ; j++) print b[j] } '
}
