#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0 --auto

dropbox start &
udiskie &
evolution &
firefox &
telegram &
st -n MUHTERM &
st -n MUHTODO -e "muhtodo.sh" &
idea &
