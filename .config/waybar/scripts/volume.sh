#!/bin/bash

# File to store previous volume
STATE_FILE="$HOME/.cache/waybar/volume_state"

# Get current mute status and volume
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes\|no')
CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -1 | tr -d '%')

if [ "$MUTED" = "no" ]; then
    # Not muted: save volume and mute
    echo "$CURRENT_VOLUME" > "$STATE_FILE"
    pactl set-sink-mute @DEFAULT_SINK@ 1
else
    # Muted: restore previous volume or default to 50%
    if [ -f "$STATE_FILE" ]; then
        PREV_VOLUME=$(cat "$STATE_FILE")
    else
        PREV_VOLUME=50
    fi
    pactl set-sink-mute @DEFAULT_SINK@ 0
    pactl set-sink-volume @DEFAULT_SINK@ "$PREV_VOLUME%"
fi
