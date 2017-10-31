#!/bin/bash

killall polybar; polybar i3 &
feh --bg-scale ~/.config/i3/wall.*
setxkbmap us,ru -option "grp:alt_space_toggle"