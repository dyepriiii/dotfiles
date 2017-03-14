#!/bin/bash

# only works for two tz
# maybe extend to work on multiple tz
# for loop ftw!

tz_hr=/tmp/tz_hr
tz_city=/tmp/tz_city

if [[ ! -e $tz_city ]]; then
    echo Europe/London > $tz_city
fi
if [[ ! -e $tz_hr ]]; then
    echo I > $tz_hr
fi

case $BLOCK_BUTTON in
    5) if [[ $(grep London $tz_city) ]]; then
        echo Asia/Manila > $tz_city;
    else
        echo Europe/London > $tz_city;
    fi
        ;;

    1) if [[ $(grep I $tz_hr) ]]; then
        echo H > $tz_hr;
    else
        echo I > $tz_hr;
    fi
        ;;
esac

hr_fmt=$(cat $tz_hr)
tz=$(cat $tz_city)
city=$(cat $tz_city | cut -f2 -d'/')

echo $city `TZ=$tz date "+ %$hr_fmt:%M %p [%a %b %d]"`
