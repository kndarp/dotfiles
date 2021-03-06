#!/usr/bin/env bash
set -e
set -o pipefail

numDisplays="$(yabai -m query --displays | jq 'length')"
currentSpace="$(yabai -m query --spaces --space | jq '.index')"

# If there is only one display, go to the next display
if [ $numDisplays -eq 1 ]; then
  lastSpace="$(yabai -m query --spaces | jq '.[] | .index' | sort -nr | head -n1)" 
  if [ $currentSpace -eq $lastSpace ]; then
    yabai -m space --focus 1
  else
    yabai -m space --focus next
  fi
  exit 1
fi

# If there are more than two displays, exit
if [ $numDisplays -gt 2 ]; then
  exit 0
fi

lastSpaceFirstMonitor="$((5))"
lastSpaceSecondMonitor="$((10))"

if [ $currentSpace -le $lastSpaceFirstMonitor ]; then
    currentFirstMonitorSpace=$currentSpace
    currentSecondMonitorSpace="$(($currentSpace + $lastSpaceSecondMonitor - $lastSpaceFirstMonitor))"
else
    currentFirstMonitorSpace="$(($currentSpace - $lastSpaceSecondMonitor + $lastSpaceFirstMonitor))"
    currentSecondMonitorSpace=$currentSpace
fi
# echo $currentFirstMonitorSpace
# echo $currentSecondMonitorSpace

if [ $currentFirstMonitorSpace -ge $lastSpaceFirstMonitor ]; then
    newFirstMonitorSpace="$((1))"
else
    newFirstMonitorSpace="$(($currentFirstMonitorSpace + 1))"
fi
if [ $currentSecondMonitorSpace -ge $lastSpaceSecondMonitor ]; then
    newSecondMonitorSpace="$(($lastSpaceFirstMonitor + 1))"
else
    newSecondMonitorSpace="$(($currentSecondMonitorSpace + 1))"
fi
# echo $newFirstMonitorSpace
# echo $newSecondMonitorSpace

if [ $currentSpace -le $lastSpaceFirstMonitor ]; then
    yabai -m space --focus $newSecondMonitorSpace && yabai -m space --focus $newFirstMonitorSpace
else
    yabai -m space --focus $newFirstMonitorSpace && yabai -m space --focus $newSecondMonitorSpace
fi
