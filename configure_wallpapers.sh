#!/usr/bin/env bash

dialog_lines=25
dialog_height=78
menu_height=16

function select_wallpaper_collection() 
{ 
  if [ "$(command -v resize)" ]; then
    eval `resize`
    dialog_lines=$LINES
    dialog_height=$COLUMNS
    menu_height=$(( $dialog_lines - 8 ))
  fi
  #  whiptail --title "Dharm's Wallpaper Collection" --menu "Select an initial wallpaper setup" 25 78 16 \
  theme=$(whiptail --menu "Select an initial wallpaper setup" "$dialog_lines" "$dialog_columns" "$menu_height" \
  "abstract" "Abstract (Default) - selection with abstract concepts as images. Art, anime, geometric, aligned" \
  "interior" "Interior- rooms with some furniture and plants" 3>&1 1>&2 2>&3)

  if ! [ -n "$theme" ]; then
    theme="abstract"
  fi

  # Create sparse checkout repo on ~/Pictures
  # https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/13738951#13738951
  mkdir -p ~/Pictures/dharmx-wps
  cd ~/Pictures/dharmx-wps
  echo "$theme" >> .themes
  echo "$theme" >> .current-theme
  #git sparse-checkout init
  #git remote add origin https://github.com/dharmx/walls.git

  git clone -n --depth=1 --filter=tree:0 https://github.com/dharmx/walls.git
  
  update_dharmx_wps
}

function update_dharmx_wps() {
  
  cd ~/Pictures/dharmx-wps/walls
  if [[ -d "$(cat ../.current-theme)" ]]; then
    rm ./.git/info/sparse-checkout
    rm -rf $(cat ../current-theme) 
  fi
  
  git sparse-checkout set --no-cone $(cat ../.current-theme)
  
  git checkout
}

#select_wallpaper_collection
update_dharmx_wps

# echo $dialog_lines
