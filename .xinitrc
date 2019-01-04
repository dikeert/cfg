#!/bin/sh

export QT_QPA_PLATFORMTHEME="lxqt"


xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 120
xrandr --output eDP-1-1 --right-of DP-1-1
xrdb -load ~/.Xresources
setxkbmap -layout us,ru -option grp:win_space_toggle
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" -0.28

compton --config ~/.config/compton.conf &

feh --bg-scale ~/.cache/wallpaper

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) 
export SSH_AUTH_SOCK
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

sh -c "sleep 1s; polybar openbox" &

$HOME/.local/bin/openbox
