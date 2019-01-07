#!/bin/bash


# connect to bluetooth headphones


DEVICE="B8:69:C2:FC:29:BA"

bluetoothctl power on
bluetoothctl connect "${DEVICE}"
