#!/bin/bash
DISPLAY=:0.0
notify-send -u critical "Doing Rsync of Calibre Library"
rsync -avz --delete "/mnt/homedsk/skinman95/Calibre Library" "/mnt/homedsk/skinman95/Dropbox" | tee "/home/skinman95/calibre_logs_bkp/rsync$(date '+%R::%F').log" || notify-send -u critical "Error sincronizando Calibre Library a Dropbox"
