#!/bin/sh

. "$HOME/.cache/wal/colors.sh"

rm ~/dotfiles/.config/zellij/themes/pywal.kdl

echo "themes {" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "    default {" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        fg \"$color0\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        bg \"$color1\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        black \"$foreground\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        red \"$color2\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        green \"$color3\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        yellow \"$color4\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        blue \"$color5\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        magenta \"$color6\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        cyan \"$color7\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        white \"$color8\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "        orange \"$color9\"" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "    }" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
echo "}" >> ~/dotfiles/.config/zellij/themes/pywal.kdl
