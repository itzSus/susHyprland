#!/bin/bash

chosen=$(echo -e " Lock\n Sleep\n Reboot\n Shutdown\n Cancel" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi -p "Power Menu")

case "$chosen" in
  " Lock") hyprlock ;;
  " Sleep") systemctl suspend ;;
  " Reboot") systemctl reboot ;;
  " Shutdown") systemctl poweroff ;;
  *) exit 0 ;;
esac
