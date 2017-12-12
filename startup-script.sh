#!/bin/bash

mkdir -p /tmp/google-chrome
mkdir -p /tmp/spotify-data
mkdir -p /tmp/firefox-cache

chown -R skinman95:skinman95 /tmp/google-chrome /tmp/spotify-data /tmp/firefox-cache

echo 1 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
echo Y | sudo tee /sys/module/snd_hda_intel/parameters/power_save_controller

pkill pulseaudio
pulseaudio --start
