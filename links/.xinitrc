# set the TERM variable to xterm-256color
# this allows some of my colorschemes to work
export TERM="xterm-256color"

# choose a cursor and background colour
xsetroot -cursor_name left_ptr
xsetroot -solid '#002b36'

# turns off screen blanking
xset s off &

# loads the .Xresources file, where urxvt settings are kept
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# if laptop is plugged into an external monitor
# VGA
if xrandr | grep 'VGA1 connected'; then
    xrandr --output LVDS1 --off --output VGA1 --auto
fi
if xrandr | grep 'VGA-1 connected'; then
    xrandr --output LVDS-1 --off --output VGA1 --auto
fi

setxkbmap -option terminate:ctrl_alt_bksp

# HDMI
if xrandr | grep 'HDMI1 connected'; then
    xrandr --output LVDS1 --off --output HDMI1 --auto
fi
if xrandr | grep 'HDMI-1 connected'; then
    xrandr --output LVDS-1 --off --output HDMI1 --auto
fi

# if we have xbindkeys configured
if [ -s ~/.xbindkeysrc ]; then
    xbindkeys
fi

# Make capslock into another control key
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

# turns off touchpad if mouse is plugged in
# if exists /dev/hidraw0 (the device file for my mouse)
if [ -e /dev/hidraw0 ]; then
    synclient TouchpadOff=1
fi

#conky -c $HOME/dotfiles/links/.conkyrc &
exec i3
