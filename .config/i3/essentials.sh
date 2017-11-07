#!/bin/bash

killall -q compton; compton -b --config ~/.config/compton.conf
killall polybar; polybar i3 &
feh --bg-scale ~/.config/i3/bg
setxkbmap us,ru -option "grp:alt_space_toggle"
