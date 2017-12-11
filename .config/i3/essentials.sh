#!/bin/bash


killall -q compton
killall polybar
compton -b --config ~/.config/compton.conf
polybar i3 &
feh --bg-scale ~/.config/i3/bg

# input settings
xinput set-prop 15 339 0, 1 # different time of acceleration for track point
xinput set-prop 15 324 1 # acceleration value for track point
xinput set-prop 14 291 1 # enable natural scrolling for trackpad
setxkbmap au,ru -option "grp:alt_space_toggle"
