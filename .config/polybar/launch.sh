#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

"$DIR/kill.sh"

if type "xrandr" >/dev/null; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        env POLYBAR_DIR="$DIR" MONITOR=$m polybar -c "$DIR/config.ini" main &
    done
else
    env POLYBAR_DIR="$DIR" polybar -c "$DIR/config.ini" main &
fi
