#!/usr/bin/env bash
set -euo pipefail

CLASS="calendar"           # must match kitty --class below
TITLE="Calendar"
APP="${1:-calcurse}"       # or ikhal

# Find an existing window by class and get its address
addr="$(hyprctl -j clients | jq -r --arg C "$CLASS" '.[] | select(.class==$C) | .address' | head -n1)"

if [ -n "$addr" ]; then
  # Focus existing window
  hyprctl dispatch focuswindow "address:$addr" >/dev/null 2>&1 || true
else
  # Launch new Kitty running the TUI app
  kitty --class="$CLASS" --title="$TITLE" -e "$APP" &
fi
