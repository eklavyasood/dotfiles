#!/bin/bash

#      _       _    __ _ _
#   __| | ___ | |_ / _(_) | ___  ___
#  / _` |/ _ \| __| |_| | |/ _ \/ __|
# | (_| | (_) | |_|  _| | |  __/\__ \
#  \__,_|\___/ \__|_| |_|_|\___||___/
#
# transfer dotfiles to relevant directory

_installSymLink() {
	name="$1"
	symlink="$2"
	linksource="$3"
	linktarget="$4"

	while true; do
		read -p "DO YOU WANT TO INSTALL ${name}? (Existing dotfiles will be removed!) (Yy/Nn): " yn
		case $yn in
		[Yy]*)
			if [ -L "${symlink}" ]; then
				rm ${symlink}
				ln -s ${linksource} ${linktarget}
				echo "Symlink ${linksource} -> ${linktarget} created."
				echo ""
			else
				if [ -d ${symlink} ]; then
					rm -rf ${symlink}/
					ln -s ${linksource} ${linktarget}
					echo "Symlink for directory ${linksource} -> ${linktarget} created."
					echo ""
				else
					if [ -f ${symlink} ]; then
						rm ${symlink}
						ln -s ${linksource} ${linktarget}
						echo "Symlink to file ${linksource} -> ${linktarget} created."
						echo ""
					else
						ln -s ${linksource} ${linktarget}
						echo "New symlink ${linksource} -> ${linktarget} created."
						echo ""
					fi
				fi
			fi
			break
			;;
		[Nn]*)
			# exit;
			break
			;;
		*) echo "Please answer yes or no." ;;
		esac
	done
}

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
while true; do
	read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
	case $yn in
	[Yy]*)
		echo "Installation started."
		break
		;;
	[Nn]*)
		exit
		break
		;;
	*) echo "Please answer yes or no." ;;
	esac
done

# ------------------------------------------------------
# Create .config folder
# ------------------------------------------------------
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
	echo ".config folder already exists."
else
	mkdir ~/.config
	echo ".config folder created."
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target

echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
_installSymLink vim ~/.config/vim ~/dotfiles/vim/ ~/.config
_installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
_installSymLink starship ~/.config/starship.toml ~/dotfiles/starship/starship.toml ~/.config/starship.toml
_installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
_installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
_installSymLink wal ~/.config/wal ~/dotfiles/wal/ ~/.config
wal -i screenshots/
echo "Pywal templates initiated!"
echo ""
echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/
_installSymLink .Xresouces ~/.Xresources ~/dotfiles/gtk/.Xresources ~/.Xresources
_installSymLink .icons ~/.icons ~/dotfiles/gtk/.icons/ ~/

echo "-------------------------------------"
echo "-> Install Hyprland dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink hypr ~/.config/hypr ~/dotfiles/.config/hypr/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
_installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
_installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
_installSymLink swappy ~/.config/swappy ~/dotfiles/swappy/ ~/.config

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE! Please reboot your system!"
