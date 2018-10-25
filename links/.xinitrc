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

if xrandr | grep "HDMI1 connected" &>/dev/null; then
    xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1
fi

exec i3
