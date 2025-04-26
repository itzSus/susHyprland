#!/bin/bash

echo "Installing dependencies..."

# Install packages (Arch based example)
sudo pacman -S --needed hyprland waybar hyprlock hypridle fuzzel kitty fish foot playerctl brightnessctl swaync spotify pavucontrol pulseaudio pipewire 

echo "Copying configs..."

# Copy configs to ~/.config
cp -r .config/* ~/.config/
cp -r assets/ ~/.config/

echo "Done! Please restart Hyprland or reboot!"
