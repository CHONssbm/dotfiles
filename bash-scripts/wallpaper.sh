#!/usr/bin/env bash

# Source pywal colors
. "$HOME/.cache/wal/colors.sh"

# Source variables and scripts
source "$HOME/bash-scripts/ansi-escape-codes.sh"
source "$HOME/bash-scripts/variables.sh"
source "$HOME/bash-scripts/wallpaper-names.sh"

WALL_PATH=$WALLPAPERS_PATH

Continue(){
  # Ask the user if they'd like to Continue
  echo "Would you like to choose a new wallpaper? [y/n]: "
    read choice
      if [ "$choice" = "y" ]; then
        clear
        Wallpaper_Function
      elif [ "$choice" = "n" ]; then
      clear
      echo "Enjoy your new wallpaper. :)"
      fi
}

Wallpaper_Function(){
# Define wallpaper options and their corresponding reload scripts
declare -A wallpapers=(
  ["1"]="WALL1 ~/bash-scripts/reload-scripts/reload_everforest.sh"
  ["2"]="WALL2 ~/bash-scripts/reload-scripts/reload_nord_vivid.sh"
  ["3"]="WALL3 ~/bash-scripts/reload-scripts/reload_tokyo_night.sh"
  ["4"]="WALL4 ~/bash-scripts/reload-scripts/reload_everforest.sh"
  ["5"]="WALL5 ~/bash-scripts/reload-scripts/reload_catpuccin_macchiato.sh"
  ["6"]="WALL6 ~/bash-scripts/reload-scripts/reload_everforest.sh"
  ["7"]="WALL7 ~/bash-scripts/reload-scripts/reload_everforest.sh"
  ["8"]="WALL8 ~/bash-scripts/reload-scripts/reload_everforest.sh"
  ["9"]="WALL9 ~/bash-scripts/reload-scripts/reload_tachikawa_vivid.sh"
  ["10"]="WALL10 ~/bash-scripts/reload-scripts/reload_catpuccin_macchiato.sh"
  ["11"]="WALL11 ~/bash-scripts/reload-scripts/reload_catpuccin_macchiato.sh"
  ["12"]="WALL12 ~/bash-scripts/reload-scripts/reload_catpuccin_macchiato.sh"
  ["13"]="WALL13 ~/bash-scripts/reload-scripts/reload_everforest.sh"

)

# Display wallpaper choices
echo -e "1.) Alleyway"
echo -e "2.) Alps Village"
echo -e "3.) City Night"
echo -e "4.) Colorado Rockies"
echo -e "5.) European City"
echo -e "6.) Fuji Temple"
echo -e "7.) Hakase :)"
echo -e "8.) Japanese Countryside"
echo -e "9.) Japanese Train Station"
echo -e "10.) Mountain Range"
echo -e "11.) Polish Village"
echo -e "12.) Rooftop"
echo -e "13.) Snowy Temple"
echo -e -n "Please choose a wallpaper [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]: "

# Process user choice
while read -r choice; do

  if [[ -n "${wallpapers[$choice]}" ]]; then
    # Get wallpaper and reload script
    IFS=" " read -r wallpaper_var reload_script <<< "${wallpapers[$choice]}" 
    
    swww img --transition-type wipe --transition-duration 2 --transition-step 120 $WALL_PATH${!wallpaper_var}  

    ### UNCOMMENT IF USING HYPRPAPER, THEN COMMENT SWWW CMD ABOVE

    # echo "" > "$HYPR_DIR"
    # echo "preload = $WALL_PATH${!wallpaper_var}" >> "$HYPR_DIR"
    # echo "wallpaper = $WALL_PATH${!wallpaper_var}" >> "$HYPR_DIR"
    # echo "splash = false" >> "$HYPR_DIR"

    sleep 2

    # Special handling f/ specific wallpapers
    if [ "$choice" -eq 6 ]; then
      wal -q -i "$WALL_PATH${!wallpaper_var}" --saturate 0.5
      yes | cp ~/.cache/wal/discord-pywal.css ~/.config/vesktop/themes/
      eval "$reload_script" & disown
      break
    elif [ "$choice" -eq 10 ]; then
      wal -q -i "$WALL_PATH${!wallpaper_var}" --saturate 0.3
      yes | cp ~/.cache/wal/discord-pywal.css ~/.config/vesktop/themes/
      eval "$reload_script" & disown
      break
    elif [ "$choice" -eq 13 ]; then
      wal -q -i "$WALL_PATH${!wallpaper_var}" --saturate 0.25
      yes | cp ~/.cache/wal/discord-pywal.css ~/.config/vesktop/themes/
      eval "$reload_script" & disown
      break
    else
      wal -q -i "$WALL_PATH${!wallpaper_var}"
      yes | cp ~/.cache/wal/discord-pywal.css ~/.config/vesktop/themes/
      eval "$reload_script" & disown
      break
    fi
  elif [ "$choice" -eq 69 ]; then
    echo "n i c e"
    sleep 2
    echo "That's not a valid wallpaper though..."
  else
    echo "Please choose a valid wallpaper..."
  fi
echo -e -n "Please choose a wallpaper [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]: "


done

Continue
}

Wallpaper_Function
