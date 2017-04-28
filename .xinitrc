#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Auth
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xss-lock -- i3lock -u -n -i ~/.wallpapers/lock/lock.png &

# Desktop Goodies
feh --bg-scale ~/.wallpapers/vimbg.png
compton -b --config ~/dotfiles/.compton &
xclip -r -selection "clipboard" &

# Notifications
notify-listener &
dunst &

# Keyboard
setxkbmap dk &
xbindkeys &

# Display
xset s 660 &

# Sound
sh -c "pactl set-sink-mute 1 false ; pactl set-sink-volume 1 40%" &

# Mouse
unclutter &

# SSH
eval $(ssh-agent &) &

# Environment Variables
dbus-update-activation-environment --systemd --all &

# RUN! You beautiful bastard!
urxvt -name scratchpad -e zsh &
exec i3
