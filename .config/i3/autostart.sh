#!/bin/bash

xrandr --setprovideroutputsource modesetting NVIDIA-0 --auto

dropbox start &
udiskie &
evolution &
firefox &
telegram &
st -c MUHTERM -n GLOBAL &
st -n MUHTODO -e "muhtodo.sh" &
idea &
