function copy_dotfiles(){
  TMP_RICING="/tmp/.ricing"
  mkdir -p $TMP_RICING
  cp -r . $TMP_RICING

  mkdir -p ~/.config/alacritty
  cp $TMP_RICING/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  cp $TMP_RICING/dotfiles/.shortcuts ~/
  mkdir -p ~/.config/wal/templates
  mkdir -p ~/.config/dunst
  cp $TMP_RICING/dotfiles/.config/dunst/dunstrc ~/.config/dunst
  cp $TMP_RICING/dotfiles/.config/rofi/QARSlp.rasi ~/.config/wal/templates
  mkdir -p ~/.config/cava
  cp $TMP_RICING/dotfiles/.config/cava/config ~/.config/wal/templates
  mkdir -p  ~/.fonts
  cp $TMP_RICING/dotfiles/.fonts/* ~/.fonts
  sudo mkdir -p /usr/share/fonts/OTF
  sudo mkdir -p /usr/share/fonts/TTF
  sudo cp $TMP_RICING/dotfiles/.fonts/*.ttf /usr/share/fonts/TTF
  sudo cp $TMP_RICING/dotfiles/.fonts/*.otf /usr/share/fonts/OTF
  fc-cache -f -v
  mkdir -p ~/.config/picom
  cp $TMP_RICING/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
  mkdir -p ~/.config/qtile
  cp $TMP_RICING/dotfiles/.config/qtile/themes/default.py ~/.config/qtile/theme.py
  cp -r $TMP_RICING/dotfiles/.config/qtile/* ~/.config/qtile/
  mkdir -p ~/.config/ranger
  cp $TMP_RICING/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
  mkdir -p ~/.config/rofi
  cp -r $TMP_RICING/dotfiles/.config/rofi/* ~/.config/rofi/
  sudo mkdir -p /root/.config/rofi
  sudo cp -r $TMP_RICING/dotfiles/.config/rofi/* /root/.config/rofi/
  sudo mkdir -p /root/.cache/wal
  sudo cp -r ~/.cache/wal/colors-rofi-dark.rasi /root/.cache/wal/
  xdg-settings set default-web-browser firefox.desktop 
  mkdir -p ~/.local/bin
  cp -r $TMP_RICING/dotfiles/.local/bin/* ~/.local/bin
  chmod +x ~/.local/bin/*
  cp $TMP_RICING/dotfiles/.zshrc ~/
  mkdir -p ~/.oh-my-zsh
  cp $TMP_RICING/dotfiles/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
  mkdir ~/Pictures
  sudo mkdir -p /usr/share/backgrounds
  mkdir -p ~/Pictures/Wallpapers
  cp -r $TMP_RICING/Wallpapers/* ~/Pictures/Wallpapers
  sudo cp $TMP_RICING/Wallpapers/wall.jpg /usr/local/backgrounds/background.png
  sudo mkdir -p /usr/local/themes
  sudo cp -r ~/.local/share/themes/FlatColor /usr/local/themes
  sudo chown $USER:$USER /usr/local/themes/FlatColor
  sudo ln -s /usr/local/themes/FlatColor /usr/share/themes/FlatColor
  sudo mkdir /usr/local/backgrounds
  sudo chown $USER:$USER /usr/local/backgrounds
  sudo mkdir -p /etc/lightdm
  sudo cp $TMP_RICING/dotfiles/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
  sudo cp $TMP_RICING/dotfiles/lightdm/lightdmxrandr.sh /usr/share
  sudo cp $TMP_RICING/dotfiles/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
  cp $TMP_RICING/dotfiles/.gitconfig ~
  cp $TMP_RICING/.local/bin/* /usr/bin/

  rm -rf $TMP_RICING
}

echo "-------------------------------------------------"
echo "-------------  COPYING --------------------------"
echo "---------------- CONFIG FILES -------------------"
echo "-------------------------------------------------"
sleep 2

copy_dotfiles
