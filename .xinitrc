# Set the background as Waldorf Grey:
hsetroot -solid "2e3436"
# loads the .Xresources file, where urxvt settings are kept
xrdb -merge ~/.Xresources
# Make capslock into another control key
if [ -s ~/.Xmodmap ]; then
  xmodmap ~/.Xmodmap
fi

# STANDARD
#exec ck-launch-session dbus-launch afterstep
#exec ck-launch-session dbus-launch amiwm
#exec ck-launch-session dbus-launch start-euclid
#exec evilwm -mask1 alt 
#exec ck-launch-session dbus-launch fvwm
#exec ck-launch-session dbus-launch icewm
exec ck-launch-session dbus-launch openbox-session
#exec ck-launch-session dbus-launch sawfish
#exec ck-launch-session dbus-launch spectrwm
#exec ck-launch-session dbus-launch xmonad

# HAVE TRIED A LITTLE
#exec ck-launch-session dbus-launch wmaker
#exec ck-launch-session dbus-launch wmii


# TO PLAY WITH
#exec ck-launch-session dbus-launch clfswm
#exec ck-launch-session dbus-launch ctwm
#exec ck-launch-session dbus-launch flwm
#exec ck-launch-session dbus-launch herbstluftwm
#exec ck-launch-session dbus-launch matchbox-window-manager
#exec ck-launch-session dbus-launch musca
#exec ck-launch-session dbus-launch mwm
#exec ck-launch-session dbus-launch olvwm
#exec ck-launch-session dbus-launch stumpwm
#exec ck-launch-session dbus-launch subtle
#exec ck-launch-session dbus-launch wind
#exec ck-launch-session dbus-launch windowlab
#exec ck-launch-session dbus-launch wm2
#exec ck-launch-session dbus-launch hackedbox

# QUARK
#exec $HOME/bin/quark3/qbg 0&
#exec $HOME/bin/quark3/qbar&
#exec $HOME/bin/quark3/qrun&
#exec $HOME/bin/quark3/qwm
