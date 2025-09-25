#!/bin/bash

# Check if ghostty is running
if ! pgrep -x "zen" > /dev/null; then
  # If it's not running, start it
  exec flatpak run app.zen_browser.zen &
else
  hyprctl dispatch workspace 2
fi
