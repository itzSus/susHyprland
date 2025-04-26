#!/bin/bash

# File to store previous mic volume
STATE_FILE="$HOME/.cache/waybar/mic_volume_state"

# Get current mute status and volume for default source
MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -o 'yes\|no')
CURRENT_VOLUME=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep -o '[0-9]\+%' | head -1 | tr -d '%')

if [ "$MUTED" = "no" ]; then
    # Not muted: save volume and mute
    echo "$CURRENT_VOLUME" > "$STATE_FILE"
    pactl set-source-mute @DEFAULT_SOURCE@ 1
else
    # Muted: restore previous volume or default to 50%
    if [ -f "$STATE_FILE" ]; then
        PREV_VOLUME=$(cat "$STATE_FILE")
    else
        PREV_VOLUME=50
    fi
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    pactl set-source-volume @DEFAULT_SOURCE@ "$PREV_VOLUME%"
fi
