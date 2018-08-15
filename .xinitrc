#!/bin/sh

export QT_QPA_PLATFORMTHEME="qt5ct"

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 120
xrdb -load ~/.Xresources
setxkbmap -layout us,ru -option grp:win_space_toggle

compton &

polybar openbox &

feh --bg-scale ~/Pictures/Wallpapers/Art/alena-aenami-dreamer-1k.png

openbox
