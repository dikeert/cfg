#!/bin/bash


MIN=10
MAX=$(cat /sys/class/backlight/intel_backlight/max_brightness)

BIG_STEP=30
SMALL_STEP=10
MICRO_STEP=1

get() {
	cat /sys/class/backlight/intel_backlight/brightness
}

set() {
	echo $1 | tee /sys/class/backlight/intel_backlight/brightness
}

up() {
	local step=$1

	local old=$(get)
	local new=$(expr $old + $step) 

	if [ $new -gt $MAX ]; then
		new=$MAX
	fi

	if [ $old -lt $MIN ]; then
		new=$(expr $old + $MICRO_STEP)
	fi

	set $new
}

down() {
	local step=$1

	local old=$(get)
	local new=$(expr $old - $step)

	if [ $new -le $MIN ]; then
		new=$MIN
	fi

	if [ $old -le $MIN ]; then
		new=$(expr $old - $MICRO_STEP)
	fi

	set $new
}

TMP="/tmp/i3backlight"
STEP=0

CURR=$(date +%s)
PREV=0

if [ -f $TMP ]; then
	PREV=$(cat $TMP)
fi

if [ $(expr $CURR - $PREV) -ge 1 ]; then
	STEP=$SMALL_STEP
else
	STEP=$BIG_STEP
fi

echo $CURR > $TMP

case "$1" in
	up)
		up $STEP
		;;
	down)
		down $STEP
		;;
	*)
		echo $"Usage: $0 {up|down}"
		exit 1
esac

