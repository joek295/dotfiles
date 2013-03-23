# Make capslock into another control key
xmodmap /.Xmodmap
# loads the .Xresources file, where urxvt settings are kept
xrdb -merge ~/.Xresources

# STANDARD
#exec ck-launch-session dbus-launch start-euclid
exec ck-launch-session dbus-launch fvwm
#exec ck-launch-session dbus-launch icewm
#exec ck-launch-session dbus-launch openbox-session
#exec ck-launch-session dbus-launch sawfish
#exec ck-launch-session dbus-launch spectrwm
#exec ck-launch-session dbus-launch xmonad

# HAVE TRIED A LITTLE
#exec ck-launch-session dbus-launch afterstep
#exec ck-launch-session dbus-launch wmaker
#exec ck-launch-session dbus-launch wmii
#exec evilwm -mask1 alt 


# TO PLAY WITH
#exec ck-launch-session dbus-launch amiwm
#exec ck-launch-session dbus-launch clfswm
#exec ck-launch-session dbus-launch flwm
#exec ck-launch-session dbus-launch herbstluftwm
#exec ck-launch-session dbus-launch musca
#exec ck-launch-session dbus-launch olvwm
#exec ck-launch-session dbus-launch stumpwm
#exec ck-launch-session dbus-launch subtle
#exec ck-launch-session dbus-launch windowlab
#exec ck-launch-session dbus-launch wm2

