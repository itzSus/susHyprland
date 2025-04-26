#!/bin/bash

# Get latest notification summaries
NOTIFS=$(swaync-client -swb 2>/dev/null | jq -r '.[0].summary // "No notifications"')

# Get calendar
CAL=$(cal | sed 's/^/    /')

# Combine both into JSON
echo "{\"text\": \"🔔 $NOTIFS\n📅 Calendar:\\n$CAL\", \"class\": \"custom-notification\"}"
