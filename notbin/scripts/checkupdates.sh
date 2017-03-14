#!/bin/bash

tmp=/tmp/checkupdates

if [[ -e $tmp ]]; then
    UPDATES=$(cat $tmp | wc -l)
        if [[ $UPDATES -gt 0 ]]; then
            echo "($UPDATES)"
            echo
            echo "#0088CC"
        else
            echo ""
        fi
else
    echo ""
fi
