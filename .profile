# Executed by the command interpreter by login shells.
# If the shell is bash, is overridden by .bash_profile or .bash_login

<<<<<<< HEAD
# mount the /dev/sda6 filesystem, where music & documents are stored
mount /dev/sda6

# if running bash then include .bashrc
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# include /sbin and /usr/sbin in PATH if they exist
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi

if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi

# if ~/bin or ~/scripts exist, include them in PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

=======
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
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi

<<<<<<< HEAD
# Set environmental variables:

# if vim is installed, both EDITOR and VISUAL are set to /usr/bin/vim
# else, fall back to ed, for that true neckbeard feel, and warn the user
if which vim >/dev/null; then
  EDITOR="vim"
  VISUAL=$EDITOR
  export EDITOR VISUAL
else
  EDITOR=/bin/ed
  export EDITOR
  if ! grep -q nickel $HOME/.motd; then 
    echo "Here's a nickel, kid. Go buy yourself a new text editor" >> $HOME/.motd
  fi
fi

# if less is installed, then PAGER is set to less, and it is instructed
# not to write a history file
# else, fall back to more
if which less >/dev/null; then
  PAGER="less"
  LESSHISTFILE=-
  export PAGER LESSHISTFILE
else
  PAGER=/bin/more
  export PAGER
fi

# Start user services in background
# remember to redirect output to /dev/null
# if mpd is not already running, then start it:
if pgrep mpd >/dev/null; then
  echo ""
else
  mpd &
fi
# if dropbox daemon is not already running, then start it
# note that the dropbox start command implies checking if running
dropbox start > /dev/null &
# index ~/ for find
find ~/ > /dev/null &

# personalised motd
# upon login, if this file exists its contents will be printed
if [ -f $HOME/.motd ]; then
  cat $HOME/.motd
fi
=======
EDITOR=/usr/bin/vim
VISUAL=$EDITOR
PAGER=/usr/bin/less LESSHISTFILE=-
export EDITOR VISUAL PAGER

pulseaudio --start &
mpd &
dropbox start &
find ~/ > /dev/null &
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
