#!/bin/bash

mkdir -p /tmp/google-chrome
mkdir -p /tmp/spotify-data
mkdir -p /tmp/firefox-cache

chown -R skinman95:skinman95 /tmp/google-chrome /tmp/spotify-data /tmp/firefox-cache

chmod o+w /sys/class/backlight/intel_backlight/brightness

# echo 1 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
# echo Y | sudo tee /sys/module/snd_hda_intel/parameters/power_save_controller

pkill pulseaudio
pulseaudio --start

# ================

vmtouch -dl /home/skinman95/.config/i3/battery_watch.sh
vmtouch -dl /home/skinman95/.config/i3/lock-screen.sh
vmtouch -dl /home/skinman95/.config/i3/show-wattage.sh
vmtouch -dl /home/skinman95/.config/i3/spotify-control.sh
vmtouch -dl /home/skinman95/.oh-my-zsh/oh-my-zsh.sh
