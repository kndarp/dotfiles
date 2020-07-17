#!/usr/bin/env bash
set -e
set -o pipefail

numDisplays="$(yabai -m query --displays | jq 'length')"

# If there is only one display, go to the next display
if [ $numDisplays -eq 1 ]; then
    yabai -m space --focus 1
else
    yabai -m space --focus 1 && yabai -m space --focus 6 
fi

# If there are more than two displays, exit
if [ $numDisplays -gt 2 ]; then
  exit 0
fi
