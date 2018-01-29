#!/bin/bash
DISPLAY=:0 notify-send -u critical "Doing Rsync of GNUCash data"
rsync -avz --delete "/home/skinman95/Documents/GNUCash" "/mnt/homedsk/skinman95/Dropbox" | tee "/home/skinman95/logs/gnucash_logs/rsync$(date '+%F:%R:%S').log" || DISPLAY=:0 notify-send -u critical "Error sincronizando GNUCash a Dropbox"
