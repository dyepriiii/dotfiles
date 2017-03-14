#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice


eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

export DMENU_OPTS='-h 32 -w 640 -i -q -p "$" -sf "#d5d5d5" -nf "#d5d5d5" -nb "#1e1e1e" -sb "#1e1e1e" -fn "Source Code Pro-10:style=Bold" -sb "#0088CC"'

numlockx &
/usr/bin/lxsession  -e i3 -s i3-dyeprii &
urxvtd &

restore_alsa() {
 while [ -z "$(pidof pulseaudio)" ]; do
  sleep 0.5
 done
 alsactl -f /var/lib/alsa/asound.state restore 
}
restore_alsa &

#setterm -blank 0 -powersave off -powerdown 0 &
#xset s off &

exec i3 > /tmp/i3.log 2>&1
#exec startkde
