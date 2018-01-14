#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96


dropbox start &
evolution &
firefox &
telegram &
st -n MUHTERM &
st -n MUHTODO -e "muhtodo.sh" &
idea &
