#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

for pid in $(get-pids polybar --findarg $DIR/config.ini | cut -d" " -f1); do

  COUNT=0
  while [[ -d "/proc/$pid" ]]; do
    if [[ "$COUNT" -eq "6" ]]; then
      echo 'Force closing, polybar not responding'
      kill -9 $pid
    fi

    kill $pid
    COUNT=$(($COUNT+1))
    sleep .3
  done
done
