#!/bin/sh

while true; do
    find /home/dyeprii/Dropbox/wpwallpapers/linux -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
    shuf -n1 -z | xargs -0 feh --bg-fill
    sleep 15m
done

