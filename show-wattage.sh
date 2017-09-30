#!/bin/bash

cat /sys/class/power_supply/BAT1/power_now | python -c 'from sys import stdin

number = float(stdin.readline().strip()) * 1e-6

print("%.1f" % number)'
