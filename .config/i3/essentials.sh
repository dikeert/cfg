#!/bin/bash

killall -q compton; compton -b --config ~/.config/compton.conf
killall polybar; polybar i3 &
feh --bg-scale ~/.config/i3/bg

# input settings
xinput set-prop 15 310 0, 1 # different time of acceleration for track point
xinput set-prop 15 295 1 # acceleration value for track point
xinput set-prop 14 291 1 # enable natural scrolling for trackpad
setxkbmap us,ru -option "grp:alt_space_toggle"
