#!/usr/bin/env bash

# Source pywal colors
. "$HOME/.cache/wal/colors.sh"

# Source variables and scripts
source "$HOME/bash-scripts/ansi-escape-codes.sh"
source "$HOME/bash-scripts/variables.sh"
source "$HOME/bash-scripts/wallpaper-names.sh"
source "$HOME/bash-scripts/GTKthemes.sh"

# Arrays (wallpapers & themes)
# PERF: Have to keep two separate arrays, since wallpaper names are different from GTK themes
declare -A wallpapers=(
  ["1"]="WALL1"
  ["2"]="WALL2"
  ["3"]="WALL3"
  ["4"]="WALL4"
  ["5"]="WALL5"
  ["6"]="WALL6"
  ["7"]="WALL7"
  ["8"]="WALL8"
  ["9"]="WALL9"
  ["10"]="WALL10"
  ["11"]="WALL11"
  ["12"]="WALL12"
  ["13"]="WALL13"
  ["14"]="WALL14"
)

declare -A themes=(
  ["1"]="THEME1"
  ["2"]="THEME2"
  ["3"]="THEME3"
  ["4"]="THEME4"
  ["5"]="THEME5"
  ["6"]="THEME6"
  ["7"]="THEME7"
  ["8"]="THEME8"
  ["9"]="THEME9"
  ["10"]="THEME10"
  ["11"]="THEME11"
  ["12"]="THEME12"
  ["13"]="THEME13"
  ["14"]="THEME14"
)

WALL_PATH=$WALLPAPERS_PATH

Continue() {
  echo "Would you like to choose a new wallpaper? [y/n]: "
  read choice
  if [ "$choice" = "y" ]; then
    clear
    Wallpaper_Function
  else
    clear
    echo "Enjoy your new wallpaper. :)"
  fi
}

Update_GTK_Theme() {
  local theme=$1
  gsettings set org.gnome.desktop.interface gtk-theme "$theme"
  gsettings set org.gnome.desktop.interface icon-theme "$theme"
}

Wallpaper_Function() {

  echo -e "1.) Alleyway"
  echo -e "2.) Alps Village"
  echo -e "3.) City Night"
  echo -e "4.) Clyford Still Museum"
  echo -e "5.) Colorado Rockies"
  echo -e "6.) European City"
  echo -e "7.) Fuji Temple"
  echo -e "8.) Hakase :)"
  echo -e "9.) Japanese Countryside"
  echo -e "10.) Japanese Train Station"
  echo -e "11.) Mountain Range"
  echo -e "12.) Polish Village"
  echo -e "13.) Rooftop"
  echo -e "14.) Snowy Temple"
  echo -e " "
  echo -e -n "Please choose a wallpaper [1-14]: "

  while read -r choice; do
    if [[ -n "${wallpapers[$choice]}" && -n "${themes[$choice]}" ]]; then
      WALLPAPER_FULL_PATH="$WALL_PATH${!wallpapers[$choice]}"
      THEME_NAME="${!themes[$choice]}"

      # Apply Wallpaper
      swww img --transition-type wipe --transition-duration 2 --transition-step 120 "$WALLPAPER_FULL_PATH"
      sleep 2

      # Apply different pywal settings for specific wallpapers
      case "$choice" in
      4) wal -q -i "$WALLPAPER_FULL_PATH" --saturate 0.25 ;;
      7) wal -q -i "$WALLPAPER_FULL_PATH" --saturate 0.5 ;;
      11) wal -q -i "$WALLPAPER_FULL_PATH" --saturate 0.3 ;;
      14) wal -q -i "$WALLPAPER_FULL_PATH" --saturate 0.25 ;;
      *) wal -q -i "$WALLPAPER_FULL_PATH" ;;
      esac

      yes | cp ~/.cache/wal/discord-pywal.css ~/.config/vesktop/themes/
      set +H
      sed -i $'9s|.*|\tpath = '"${WALLPAPER_FULL_PATH}"'|' ~/.config/hypr/hyprlock.conf

      pywalfox update &>/dev/null &
      disown

      killall waybar
      setsid waybar &>/dev/null &
      disown

      # Apply GTK theme
      Update_GTK_Theme "$THEME_NAME"

      break

    elif [ "$choice" -eq 69 ]; then
      clear
      echo "n i c e"
      sleep 2
      echo "That's not a valid wallpaper though..."
      sleep 2
      clear
      Wallpaper_Function
    else
      echo "Please choose a valid wallpaper..."
      sleep 2
      clear
      Wallpaper_Function
    fi
  done
  Continue
}

Wallpaper_Function
