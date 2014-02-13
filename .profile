# Executed by the command interpreter by login shells.
# If the shell is bash, is overridden by .bash_profile or .bash_login

# if running bash then include .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# include sbin in PATH
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi

EDITOR=/usr/bin/vim
VISUAL=$EDITOR
PAGER=/usr/bin/less LESSHISTFILE=-
export EDITOR VISUAL PAGER

pulseaudio --start &
dropbox start &
find ~/ > /dev/null &
