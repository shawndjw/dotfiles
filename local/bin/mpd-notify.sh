#!/bin/bash

last=""
while true; do
  current=$(mpc current)
  if [[ "$current" != "$last" && -n "$current" ]]; then
    artist=$(mpc --format '%artist%' current)
    title=$(mpc --format '%title%' current)
    notify-send -a "MPD" "$artist" "$title"
    last="$current"
  fi
  sleep 5
done
