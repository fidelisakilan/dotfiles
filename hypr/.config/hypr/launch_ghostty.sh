#!/bin/bash

# Check if ghostty is running
if ! pgrep -x "ghostty" > /dev/null; then
  # If it's not running, start it
  exec ghostty &
else
  hyprctl dispatch workspace 1
fi
