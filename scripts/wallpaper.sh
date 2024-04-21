#!/bin/bash
# __        __    _ _
# \ \      / /_ _| | |_ __   __ _ _ __   ___ _ __
#  \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
#   \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
#    \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
#                    |_|         |_|
# -----------------------------------------------------

# Select wallpaper
selected=$(ls -1 ~/hypr-wallpapers | rofi -dmenu -config ~/dotfiles/.config/rofi/config-wallpaper.rasi -p "Wallpapers")

if [ "$selected" ]; then

	echo "Changing theme..."
	# Update wallpaper with pywal
	wal -q -i ~/hypr-wallpapers/$selected

	# Wait for 1 sec
	sleep 1

	# Reload qtile to color bar
	qtile cmd-obj -o cmd -f reload_config

	# Get new theme
	source "$HOME/.cache/wal/colors.sh"

	newwall=$(echo $wallpaper | sed "s|$HOME/hypr-wallpapers/||g")

	# -----------------------------------------------------
	# Copy selected wallpaper into .cache folder
	# -----------------------------------------------------
	cp $wallpaper ~/.cache/current_wallpaper.png

	sleep 1

	# Send notification
	notify-send "Colors and Wallpaper updated" "with image $newwall"

	echo "Done."
fi
