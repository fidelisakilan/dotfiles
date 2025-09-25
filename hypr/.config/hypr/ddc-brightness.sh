#!/usr/bin/env bash

STEP=5
ACTION="$1"
MONITOR_ID=1
STATE_FILE="/tmp/monitor_brightness"

# Load last known value or get it fresh
if [[ -f "$STATE_FILE" ]]; then
    current=$(<"$STATE_FILE")
else
    current=$(ddcutil --display "$MONITOR_ID" getvcp 10 \
              | grep -oP 'current value =\s*\K[0-9]+')
fi

if [[ "$ACTION" == "up" ]]; then
    new=$(( current + STEP ))
else
    new=$(( current - STEP ))
fi

(( new < 0 )) && new=0
(( new > 100 )) && new=100

echo "$new" > "$STATE_FILE"
ddcutil --display "$MONITOR_ID" setvcp 10 "$new" >/dev/null 2>&1 &

