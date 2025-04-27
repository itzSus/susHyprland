
#!/bin/bash

# Colors for terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${RED}WARNING: This will overwrite your existing configs in ~/.config/!${NC}"
echo -e "${YELLOW}Make sure you have backups if needed.${NC}"
read -p "Do you want to continue? (y/n): " choice

if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    echo -e "${RED}Install cancelled.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing dependencies...${NC}"

sudo pacman -S --needed hyprland waybar hyprlock hypridle fuzzel kitty fish foot playerctl brightnessctl swaync spotify ly pavucontrol pulseaudio pipewire
systemctl enable ly
systemctl start ly

echo -e "${GREEN}Copying configs...${NC}"

mkdir -p ~/.config
cp -r .config/* ~/.config/

mkdir -p ~/.config/assets
cp -r assets/* ~/.config/assets/


echo -e "${GREEN}✅ Installation complete! Please reboot or restart Hyprland!${NC}"
