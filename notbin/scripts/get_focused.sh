#!/bin/bash

id=$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')
name=$(xprop -id $id | awk '/_NET_WM_NAME/{$1=$2="";print}' | cut -d'"' -f2)
size=${#name}
if [[ size -gt 50 ]]; then
    title=$(iconv -f utf-8 -t utf-8 -c <<< "$(echo $name | cut -c1-47)")
    echo ${title}...
else
    title=$(iconv -f utf-8 -t utf-8 -c <<< "$name")
    echo ${title}
fi
