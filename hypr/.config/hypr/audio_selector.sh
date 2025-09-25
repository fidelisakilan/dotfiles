#!/bin/bash

sink_lines=$(wpctl status | sed -n '/Sinks:/,/Sources:/p' | grep '\. ')

choice=$(echo "$sink_lines" | rofi -dmenu -p "Audio Output")

sink_id=$(echo "$choice" | grep -oP '\d+(?=\.)')

if [[ -n "$sink_id" ]]; then
    wpctl set-default "$sink_id"
fi
