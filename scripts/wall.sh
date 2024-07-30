#!/bin/bash

cache_file="$HOME/.cache/current_wallpaper"
blurred="$HOME/.cache/blurred_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"
blur_file="$HOME/dotfiles/.settings/blur.sh"

blur="50x30"
blur=$(cat $blur_file)

# create cache file if it doesn't exist
if [ ! -f $cache_file ] ;then
  touch $cache_file
  echo "$HOME/wallpaper/default.jpg" > "$cache_file"
fi

if [ ! -f $rasi_file ] ;then
  touch $rasi_file
  echo "* { current-image: url(\"$HOME/wallpaper/default.jpg\", height); }" > "$rasi.file"
fi

current_wallpaper=$(cat "$cache_file")

case "$1" in
  "init")
    sleep 1
    if [ -f $cache_file ] ;then
      wal -q -i $current_wallpaper
    else
      wal -q -i ~/wallpaper/
    fi
  ;;
  "select")
    sleep 0.2
    selected=$( find "$HOME/wallpaper" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read rfile
    do 
      echo -en "$rfile\x00icon\x1f$HOME/wallpaper/${rfile}\n"
    done | rofi -dmenu -i -replace -config ~/dotfiles/.config/rofi/config-wallpaper.rasi)
    if [ ! "$selected" ] ;then
      echo "No wallpaper selected"
      exit
    fi
    wal -q -i ~/wallpaper/$selected
  ;;
  *) wal -q -i ~/wallpaper/
  ;;

esac

source "$HOME/.cache/wal/colors.sh"
echo ":: Wallpaper: $wallpaper"

newwal=$(echo $wallpaper | sed "s|$HOME/wallpaper/||g")

~/dotfiles/.config/waybar/launch.sh

transition_type="wipe"
# transition_type="outer"
# transition_type="random"

wallpaper_engine=$(cat $HOME/dotfiles/.settings/wallpaper-engine.sh)
if [ "$wallpaper_engine" == "swww" ] ;then
  # swww
  echo ":: Using swww"
  swww img $wallpaper \
    --transition-bezier .42,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type=$transition_type \
    --transition-duration=0.7 \
    --transition-pos "$( hyprctl cursorpos )"
elif [ "$wallpaper_engine" == "hyprpaper" ] ;then
  # hyprpaper
  echo ":: Using hyprpaper"
  killall hyprpaper
  wal_tpl=$(cat $HOME/dotfiles/.settings/hyprpaper.tpl)
  output=${wal_tpl/WALLPAPER/$wallpaper}
  echo "$output" > $HOME/dotfiles/.config/hypr/hyprpaper.conf
  hyprpaper &
else
  sleep 1
  dunstify "Changing wallpaper ..." "with image $newwal" -h int:value:33 -h string:x-dunst-stack-tag:wallpaper
  sleep 2
fi


if [ "$1" == "init" ] ;then
  echo ":: Init"
else
  dunstify "Creating blurred version .." "with image $newwal" -h int:value:66 -h string:x-dunst-stack-tag:wallpaper
fi

magick $wallpaper -resize 75% $blurred
echo ":: Resized to 75%"
if [ ! $"$blur" == "0x0" ] ;then
  magick $blurred -blur $blur $blurred
  echo ":: Blurred"
fi
  

echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$blurred\", height); }" > "$rasi_file"


if [ "$1" == "init" ] ;then
  echo ":: Init"
else
  dunstify "Wallpaper procedure complete!!" "with image $newwal" -h int:value:100 -h string:x-dunst-stack-tag:wallpaper
fi

echo "DONE!"
