#!/bin/bash

# Install the dotfiles in the .dotfiles directory into their rightfull places:
# symlink the dotfiles to the correct places

# N.B. This requires bash because inline pattern-substitution in this way is a bashism.

# MAKE SURE THESE DIRECTORIES HAVE THE CORRECT SETTINGS BEFORE RUNNING
DOTDIR=$HOME/media/dotfiles/links
TARGET=$HOME

overwrite=true

link_files_overwriting () {
  ln -sf $1 $2
  }

link_files_safe () {
  ln -s $1 $2
  }

for dotfile in `find $DOTDIR -type f`
do
    if [ $overwrite=="true" ]; then
        link_files_overwriting $dotfile ${dotfile/$DOTDIR/$TARGET}
    else
        link_files_safe $dotfile ${dotfile/$DOTDIR/$TARGET}
    fi
done
