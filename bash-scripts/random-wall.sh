#!/usr/bin/env bash

source $HOME/bash-scripts/variables.sh

# Random Wallpaper Variable

NEW_WALL=$(find $WALLPAPERS_PATH -type f | shuf -n 1)


# Manually echo's the $NEW_WALL into hyprpaper.conf

echo '' > $(echo $HYPR_DIR)

echo "preload = $NEW_WALL" >> $(echo $HYPR_DIR)
echo "wallpaper =,$NEW_WALL" >> $(echo $HYPR_DIR)
echo "splash - false" >> $(echo $HYPR_DIR)


# Takes $NEW_WALL and copies it into ~/.cache 

cp -rf $NEW_WALL ~/.cache/current_wallpaper


# Quietly runs wal -i on $NEW_WALL, then executes the reload script

wal -q -i $NEW_WALL  
~/bash-scripts/reload.sh
