# -*- sh -*-

# This file contains zsh-specific aliases.  zsh supports a greatly
# expanded alias syntax over bash, and aliases which are only valid in
# zsh go in this file.

# global aliases are expanded wherever in the command they are placed

alias -g putils=~/code/perl/perlutils
alias -g media=~/media
alias -g dotfiles=/home/joe/dotfiles
alias -g scripts=/home/joe/scripts
alias -g L='| less'

# suffix aliases associate a file extension with a given command.
# Simply entering a filename will run the command associated with that
# file's extension.

alias -s tex=emacs
alias -s c=emacs
alias -s pdf="zathura &"
alias -s bf=/home/joe/code/brainfuck/brainfuck
