#!/bin/bash

cat /sys/class/power_supply/BAT1/power_now | python ~/.config/i3/show-wattage.py
