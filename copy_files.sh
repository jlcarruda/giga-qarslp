function copy_dotfiles(){
  mkdir -p /tmp/.ricing
  cp -r . /tmp/.ricing

  mkdir -p ~/.config/alacritty
  cp /tmp/.ricing/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  cp /tmp/.ricing/dotfiles/.shortcuts ~/
  mkdir -p ~/.config/wal/templates
  mkdir -p ~/.config/dunst
  cp /tmp/.ricing/dotfiles/.config/dunst/dunstrc ~/.config/wal/templates
  cp /tmp/.ricing/dotfiles/.config/rofi/QARSlp.rasi ~/.config/wal/templates
  mkdir -p ~/.config/cava
  cp /tmp/.ricing/dotfiles/.config/cava/config ~/.config/wal/templates
  mkdir -p  ~/.fonts
  cp /tmp/.ricing/dotfiles/.fonts/* ~/.fonts
  fc-cache -f -v
  mkdir -p ~/.config/picom
  cp /tmp/.ricing/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
  mkdir -p ~/.config/qtile
  cp /tmp/.ricing/dotfiles/.config/qtile/themes/default.py ~/.config/qtile/theme.py
  cp -r /tmp/.ricing/dotfiles/.config/qtile/* ~/.config/qtile/
  mkdir -p ~/.config/ranger
  cp /tmp/.ricing/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
  mkdir -p ~/.config/rofi
  cp -r /tmp/.ricing/dotfiles/.config/rofi/* ~/.config/rofi/
  sudo mkdir -p /root/.config/rofi
  sudo cp -r /tmp/.ricing/dotfiles/.config/rofi/* /root/.config/rofi/
  sudo mkdir -p /root/.cache/wal
  sudo cp -r ~/.cache/wal/colors-rofi-dark.rasi /root/.cache/wal/
  xdg-settings set default-web-browser firefox.desktop 
  mkdir -p ~/.local/bin
  cp -r /tmp/.ricing/dotfiles/.local/bin/* ~/.local/bin
  chmod +x ~/.local/bin/*
  cp /tmp/.ricing/dotfiles/.zshrc ~/
  mkdir -p ~/.oh-my-zsh
  cp /tmp/.ricing/dotfiles/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
  mkdir ~/Pictures
  sudo mkdir -p /usr/share/backgrounds
  mkdir -p ~/Pictures/Wallpapers
  cp -r /tmp/.ricing/Wallpapers/* ~/Pictures/Wallpapers
  sudo cp /tmp/.ricing/Wallpapers/wall.jpg /usr/local/backgrounds/background.png
  sudo mkdir -p /usr/local/themes
  sudo cp -r ~/.local/share/themes/FlatColor /usr/local/themes
  sudo chown $USER:$USER /usr/local/themes/FlatColor
  sudo ln -s /usr/local/themes/FlatColor /usr/share/themes/FlatColor
  sudo mkdir /usr/local/backgrounds
  sudo chown $USER:$USER /usr/local/backgrounds
  sudo cp /tmp/.ricing/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
  
  rm -rf /tmp/.ricing
}

copy_dotfiles
