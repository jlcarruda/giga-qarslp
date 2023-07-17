#!/bin/bash
# ________   ___   ________   ________                       
# |\   ____\ |\  \ |\   ____\ |\   __  \                      
# \ \  \___| \ \  \\ \  \___| \ \  \|\  \                     
#  \ \  \  ___\ \  \\ \  \  ___\ \   __  \                    
#   \ \  \|\  \\ \  \\ \  \|\  \\ \  \ \  \                   
#    \ \_______\\ \__\\ \_______\\ \__\ \__\                  
#     \|_______| \|__| \|_______| \|__|\|__|                  
#                                                             
#                                                            
#  ________   ___   ________   ___   ________    ________     
# |\   __  \ |\  \ |\   ____\ |\  \ |\   ___  \ |\   ____\    
# \ \  \|\  \\ \  \\ \  \___| \ \  \\ \  \\ \  \\ \  \___|    
#  \ \   _  _\\ \  \\ \  \     \ \  \\ \  \\ \  \\ \  \  ___  
#   \ \  \\  \|\ \  \\ \  \____ \ \  \\ \  \\ \  \\ \  \|\  \ 
#    \ \__\\ _\ \ \__\\ \_______\\ \__\\ \__\\ \__\\ \_______\
#     \|__|\|__| \|__| \|_______| \|__| \|__| \|__| \|_______|
##
# 
#                                                    - jlcarruda
#                                                      Inspired by @gibranlp ricing: QARSlp

## Variables
VERSION="1.0.0"
NODE_VERSION="18"
VIDEO_DRIVER="xf86-video-vmware"
BASE_PACKAGES_FILE='base_packages.txt'
AUR_PACKAGES_FILE='aur_packages.txt'
PIP_PACKAGES_FILE="pip_packages.txt"

screen_size=$(stty size 2>/dev/null || echo 24 80)
rows=$(echo $screen_size | awk '{print $1}')
columns=$(echo $screen_size | awk '{print $2}')

function check_install_dependencies() {
  sudo pacman -S --noconfirm extra/libnewt python-pip "$VIDEO_DRIVER"
}

function install_base_packages()
{
  echo "::::: Installing base packages :::::"
  while read -r package; do
    echo "Installing ${package}..."
    sudo pacman -S --noconfirm "$package"
  done < "$BASE_PACKAGES_FILE"

  echo ":::"
  echo "Instalation complete!"
}

function paru_install()
{
  if [ "$(command -v paru)" ]; then
    echo "===> PARU is already installed. Moving foward..."
    return
  fi
  echo "::::: Installing paru AUR helper :::::"
  git clone https://aur.archlinux.org/paru.git 
  cd paru 
  makepkg -si --noconfirm
  cd ..
  rm -rf paru
}

function install_aur_packages()
{
  echo "::::: Installing AUR Packages :::::"
  while read -r package; do
    echo "Installing AUR package ${package}..."
    paru -S --noconfirm "$package"
  done < "$AUR_PACKAGES_FILE"

  echo ":::"
  echo "Instalation complete!"
}

function install_pip_packages()
{ 
  pip install -r "$PIP_PACKAGES_FILE" --break-system-packages

  echo "::: "
  echo "Installation complete!"
}

./ascii-art.sh
echo "-------------------------------------------------"
echo "-------------  PACKAGE --------------------------"
echo "---------------- INSTALLATION -------------------"
echo "-------------------------------------------------"
sleep 2

check_install_dependencies

paru_install
install_base_packages
install_aur_packages
install_pip_packages
./copy_files.sh
./configure.sh
