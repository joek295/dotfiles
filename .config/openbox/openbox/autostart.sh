## Openbox autostart.sh
## ====================
## Note*: some programs, such as 'nm-applet' are run via XDG autostart.
## Run '/usr/lib/openbox/openbox-xdg-autostart --list' to list these

tint2 &
conky &
#conky -c ~/dotfiles/bigconky &
#wallpaper &
(sleep 2s && pnmixer) &
xfce4-power-manager &
hsetroot -solid "#2e3436"

## Detect and configure touchpad. See 'man synclient' for more info.
if egrep -iq 'touchpad' /proc/bus/input/devices; then
    synclient VertEdgeScroll=1 &
    # uncomment to enable touchpad-tapping for clicking. 
    # turned off because this annoys me
#    synclient TapButton1=1 &
fi

# Keyboard delay and repeat rate in ms
xset r rate 250 25 &

## GNOME PolicyKit and Keyring
(\
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 && \
/usr/bin/gnome-keyring-daemon --start --components=ssh && \
/usr/bin/gnome-keyring-daemon --start --components=secrets && \
/usr/bin/gnome-keyring-daemon --start --components=pkcs11 && \
/usr/bin/gnome-keyring-daemon --start --components=gpg \
) &
