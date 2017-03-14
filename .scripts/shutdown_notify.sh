#!/bin/bash
# depends:
#   see: https://phyks.me/2014/02/notif_weechat_urxvt.html
#   URxvt*urgentOnBell: true
#   dunst

sleep +20m
notify-send "$HOSTNAME will be powered off in 60 seconds"
sleep 60
sudo poweroff
