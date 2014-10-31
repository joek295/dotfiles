# Executed by the command interpreter by login shells.
# If the shell is bash, .bash_profile or .bash_login override this
# zsh doesn't look at this but instead .zprofile

# MOUNTING
# mount the /dev/sda6 filesystem, where music & documents are stored
mount /dev/sda6

# PATH
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

if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi

# ENVIRONMENT
# if vim is installed, both EDITOR and VISUAL are set to /usr/bin/vim
# else, fall back to ed/vi, and warn the user, who might expect a more modern editor
if which vim >/dev/null; then
  EDITOR="vim"
  VISUAL=$EDITOR
else
  if which vi >/dev/null; then
    EDITOR="vi"
    VISUAL=$EDITOR
  else
    EDITOR=/bin/ed
    VISUAL=""
  fi
  if ! grep -q nickel $HOME/.motd; then 
    echo "Here's a nickel, kid. Go buy yourself a new text editor" >> $HOME/.motd
    echo "vim doesn't appear to be installed on this machine: editor is" $EDITOR >> $HOME/.motd
  fi
fi
export EDITOR VISUAL

# if less is installed, then PAGER is set to less, and it is instructed
# not to write a history file; else, fall back to more
if which less >/dev/null; then
  PAGER="less"
  LESSHISTFILE=-
  export LESSHISTFILE
else
  PAGER=/bin/more
  if ! grep -q less $HOME/.motd; then
    echo "Cannot find less. Falling back to /bin/more." >> $HOME/.motd
  fi
fi
export PAGER

# USER SERVICES
# remember to redirect output to /dev/null
# if mpd is installed and not already running, then start it:
if which mpd >/dev/null; then
  if pgrep mpd >/dev/null; then
    break
  else
    mpd &
  fi
fi

# if dropbox daemon is not already running, then start it
# note that the dropbox start command implies checking if running
if which dropbox > /dev/null; then 
  dropbox start > /dev/null &
fi

# index ~/ for find
find ~/ > /dev/null &

# start the emacs daemon
if which emacs >/dev/null; then
  emacs --daemon >/dev/null &
fi

# turns off touchpad if mouse is plugged in
# if exists /dev/hidraw0 (the device file for my mouse)
if [ -e /dev/hidraw0 ]; then
  # turn off touchpad
  synclient TouchpadOff=1
fi

# MOTD
# upon login, if this file exists its contents will be printed
if [ -f $HOME/.motd ]; then
  cat $HOME/.motd
fi

# and then, if fortune is installed:
if [ -f $HOME/fortunes/fortunes ]; then
  FORTUNES=$HOME/fortunes/fortunes
fi
if which fortune >/dev/null; then
  fortune $FORTUNES
fi

# LOADING FURTHER CONFIGURATION
# some versions of ksh require that ENV is set to ~/.kshrc
# in order to read ~/.kshrc
if [ $SHELL = "/bin/ksh" ]; then
    if [ -f "$HOME/.kshrc" ]; then
        ENV=$HOME/.kshrc
        export ENV
    fi
fi
