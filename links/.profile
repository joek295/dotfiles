# Executed by the command interpreter by login shells.
# If the shell is bash, .bash_profile or .bash_login override this
# zsh doesn't look at this but instead .zprofile

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
    # if ~/scripts/dmenu exists, include in PATH
    if [ -d "$HOME/scripts/dmenu" ] ; then
        PATH="$HOME/scripts/dmenu:$PATH"
    fi
fi

# ENVIRONMENT
if command -v vim >/dev/null 2>&1; then
    EDITOR="vim"
    VISUAL=$EDITOR
else
    EDITOR="vi"
    VISUAL=$EDITOR
fi
export EDITOR VISUAL

PAGER="less"
export PAGER

# USER SERVICES

# If dropbox daemon is not already running, then start it.  NB: the
# dropbox start command implies checking if running.
#if command -v dropbox >/dev/null 2>&1; then
#    dropbox start >/dev/null &
#fi

# turns off touchpad if mouse is plugged in
# if exists /dev/hidraw0 (the device file for my mouse)
if [ -e /dev/hidraw0 ]; then
    if command -v synclient >/dev/null 2>&1; then
        synclient TouchpadOff=1
    fi
fi

# if fortune is installed:
if command -v fortune >/dev/null 2>&1; then
    if [ -f $HOME/fortunes/fortunes ]; then
        fortune $HOME/fortunes/fortunes
    else
        fortune
    fi
fi
