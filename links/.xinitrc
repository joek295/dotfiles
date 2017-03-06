# loads the .Xresources file, where urxvt settings are kept
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

setxkbmap -option ctrl:nocaps

# if we have xbindkeys configured
if [ -s ~/.xbindkeysrc ]; then
    xbindkeys
fi

exec i3
