#!/bin/bash
notify-send -u critical "Doing Rsync of Calibre Library"
rsync -avz --delete "/mnt/homedsk/skinman95/Calibre Library" "/mnt/homedsk/skinman95/Dropbox" | tee "/home/skinman95/rsync$(date '+%R::%F').log" || notify-send -u critical "Error sincronizando Calibre Library a Dropbox"
