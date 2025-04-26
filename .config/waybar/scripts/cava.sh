#!/bin/bash

bars=8
fifo="/tmp/cava.fifo"
glyphs=("▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")
#glyphs=(" " "╺" "─" "━" "╸" "─" "╺" "━")

# Kill any existing cava process
pkill -f "cava -p ~/.config/cava/waybar.conf" || true


[ -p "$fifo" ] || mkfifo "$fifo"

# Start cava in background
cava -p ~/.config/cava/waybar.conf &

# Read FIFO output
while true; do
    if read -r line < "$fifo"; then
        # Split line into array
        IFS=';' read -ra values <<< "$line"
        output=""
        for ((i=0; i<bars; i++)); do
            value=${values[$i]:-0}
            index=$((value * (${#glyphs[@]} - 1) / 7))
            output+="${glyphs[$index]}"
        done
        echo "$output"   
    fi
done
