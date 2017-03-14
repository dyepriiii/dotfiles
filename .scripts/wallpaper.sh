#!/usr/bin/sh

# depends:
#   feh

DIR="/home/$USER/.wallpaper"
while [ 1 ]
do
    echo $DIR
    file=$(python -c """import os; import random; print(random.choice(os.listdir('$DIR')))""")
    feh --bg-tile $DIR/$file
    sleep 180
done
