#!/bin/bash

# Select a region with slurp
region=$(slurp)

# If no region is selected (e.g., escape pressed), exit
if [ -z "$region" ]; then
    echo "No region selected, exiting."
    exit 1
fi

# Output filename with timestamp
output="$HOME/Videos/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"

# Start wf-recorder with the selected region
notify-send "Recording Started"
wf-recorder -g "$region" -f "$output"
