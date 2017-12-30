#!/usr/bin/env sh

image_file=/tmp/screen_lock.png
resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
# filters='noise=alls=10,scale=iw*.05:-1,scale=iw*20:-1:flags=neighbor'
filters='gblur=sigma=10:sigmaV=10'
ffmpeg -y -loglevel 0 -s "$resolution" -f x11grab -i $DISPLAY -vframes 1 \
       -vf "$filters" "$image_file"

# ffmpeg -y -loglevel 0 -s "$resolution" -f x11grab -i $DISPLAY -vframes 1 \
#   "$image_file"
i3lock -e -f -i "$image_file"
