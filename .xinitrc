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

# Authentication Agent
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# Wallpaper manager
~/dotfiles/scripts/background &
# Composite Manager
compton -b --config ~/dotfiles/.compton &
# Notifications
dunst &
# Keyboard layout
setxkbmap dk &
# Set initial monitor backlight
# xbacklight -set 50% &
# Set initial volume
sh -c "pactl set-sink-mute 1 false ; pactl set-sink-volume 1 40%" &
# Monitor blanking/ 11m
xset s 660 &
# Multimedia keys binding
xbindkeys &
# Clipboard
xclip -selection clipboard &
# Hide mouse on inactivity 
unclutter &
# Screen locker
xss-lock -- i3lock -u -n -i ~/.wallpapers/lock/lock.png &
# SSH-agent
eval $(ssh-agent &)
# Set Environment Variables
dbus-update-activation-environment --systemd --all
# RUN! You beautiful bastard!
urxvt -name scratchpad -e zsh &
exec i3
