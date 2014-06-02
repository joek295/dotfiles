<<<<<<< HEAD
Set the background as Waldorf Grey:
=======
 Set the background as Waldorf Grey:
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
hsetroot -solid "#2e3436"
#hsetroot -fill ~/images/wallpapers/tea/Tea-tea-13892949-1920-1200.jpg
# loads the .Xresources file, where urxvt settings are kept
xrdb -merge ~/.Xresources
# Make capslock into another control key
<<<<<<< HEAD
if [ -f ~/.Xmodmap ]; then
=======
if [ -s ~/.Xmodmap ]; then
>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
  xmodmap ~/.Xmodmap
fi
# turns off touchpad
#synclient TouchpadOff=1

#exec ck-launch-session dbus-launch fvwm
#exec ck-launch-session dbus-launch openbox-session
#exec ck-launch-session dbus-launch sawfish
#exec ck-launch-session dbus-launch spectrwm
<<<<<<< HEAD
exec xmonad
=======
exec ck-launch-session dbus-launch xmonad

>>>>>>> 962a925543e61c9fc6daadd315ef6e0fcccf8678
