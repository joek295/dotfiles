# loads the .Xresources file, where urxvt settings are kept
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

# if we have xbindkeys configured
if [ -s ~/.xbindkeysrc ]; then
    xbindkeys
fi

redshift -l 51:0 &

exec i3
