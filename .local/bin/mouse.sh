#!/bin/bash


# connect to bluetooth headphones

DEVICE="C0:33:5E:04:83:B9"


bluetoothctl power on
bluetoothctl connect "${DEVICE}"
