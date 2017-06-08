#!/bin/bash


    while true
    do
        export DISPLAY=:0.0
        battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
        if [ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ] ; then
            if [ $battery_level -ge 90 ] && [ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ] ; then
                notify-send -u normal "Battery charging above 90%. Please unplug your AC adapter!" "Charging: ${battery_level}% "
                sleep 20
                #if on_ac_power; then
                    #gnome-screensaver-command -l   ## lock the screen if you don't unplug AC adapter after 20 seconds
                #fi
             fi
        else
             if [ $battery_level -le 10 ] && ! [ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ] ; then
                notify-send -u critical "Battery is lower 10%. Need charging! Please plug your AC adapter." "Charge: ${battery_level}%"
                sleep 20
                #if ! on_ac_power; then
                    #gnome-screensaver-command -l   ## lock the screen if you don't plug AC adapter after 20 seconds
                #fi
             fi
        fi

        sleep 30 # 300 seconds or 5 minutes
    done
