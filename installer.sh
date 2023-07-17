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

# Dialog Screen
r=$(( rows / 2 ))
c=$(( columns / 2 ))

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

function base_install()
{
  whiptail --msgbox --backtitle "GIGA Installer $VER" --title "Base Packages Install" "The base packages needed for GIGA to work will be installed now \n \n Click OK to Continue" ${r} ${c}
    
  whiptail --title "Package Installation" --gauge "Installing ..." 6 50 0 < <(install_base_packages) 2>&1
}

function paru_install()
{
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

function aur_install()
{
  whiptail --msgbox --backtitle "GIGA Installer $VER" --title "AUR Packages Install" "The base packages needed for GIGA to work will be installed now \n \n Click OK to Continue" ${r} ${c}
    
  whiptail --title "AUR Package Installation" --gauge "Installing ..." 6 50 0 < <(install_aur_packages) 2>&1
}

function install_pip_packages()
{
  #TOTAL_PACKAGES=$(wc -l < "$PIP_PACKAGES_FILE")
  #count=0
  
  pip install -r "$PIP_PACKAGES_FILE" --break-system-packages

  echo "::: "
  echo "Installation complete!"
}

function pip_install()
{
  whiptail --msgbox --backtitle "GIGA Installer $VER" --title "Pip Packages Install" "The base packages needed for GIGA to work will be installed now \n \n Click OK to Continue" ${r} ${c}
    
  whiptail --title "Pip Package Installation" --gauge "Installing ..." 6 50 0 < <(install_pip_packages) 2>&1
}

function installMenu(){
  CHOICES=$(whiptail --menu "GIGA Rice Installation" ${r} ${c} 5 \
  "Install Base Packages" " " \
  "Install Pip Packages" " " \
  "Install AUR Packages" " " \
  "Copy all Dotfiles" " " \
  "Post Installation" " " 3>&1 1>&2 2>&3)

  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "1")
      base_install >&2
      ;;
    "2")
      pip_install >&2
      ;;
    "3")
      paru_install >&2
      aur_install >&2
      ;;
    "4")
      ;;
    *)
      echo "Unsupported item $CHOICE!" >&2
      exit 1
      ;;
    esac
  done
}

../ascii-art.sh
echo "#################################################"
echo "#############  PACKAGE ##########################"
echo "################ INSTALLATION ###################"
echo "#################################################"
check_install_dependencies

paru_install
install_base_packages
install_aur_packages
install_pip_packages
./copy_files.sh

#echo "Configuring X..."
#Xorg :0 -configure
#cp /root/xorg.conf.new /etc/X11/xorg.conf

