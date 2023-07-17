function copy_dotfiles(){
  mkdir -p ~/.config/alacritty
  cp ~/giga-qarslp/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
  cp ~/giga-qarslp/dotfiles/.shortcuts ~/
  mkdir -p ~/.config/wal/templates
  mkdir -p ~/.config/dunst
  cp ~/giga-qarslp/dotfiles/.config/dunst/dunstrc ~/.config/wal/templates
  cp ~/giga-qarslp/dotfiles/.config/rofi/QARSlp.rasi ~/.config/wal/templates
  mkdir -p ~/.config/cava
  cp ~/giga-qarslp/dotfiles/.config/cava/config ~/.config/wal/templates
  mkdir -p  ~/.fonts
  cp ~/giga-qarslp/dotfiles/.fonts/* ~/.fonts
  fc-cache -f -v
  mkdir -p ~/.config/picom
  cp ~/giga-qarslp/dotfiles/.config/picom/picom.conf ~/.config/picom/picom.conf
  mkdir -p ~/.config/qtile
  cp ~/giga-qarslp/dotfiles/.config/qtile/themes/default.py ~/.config/qtile/theme.py
  cp -r ~/giga-qarslp/dotfiles/.config/qtile/* ~/.config/qtile/
  mkdir -p ~/.config/ranger
  cp ~/giga-qarslp/dotfiles/.config/ranger/rc.conf ~/.config/ranger/rc.conf
  mkdir -p ~/.config/rofi
  cp -r ~/giga-qarslp/dotfiles/.config/rofi/* ~/.config/rofi/
  sudo mkdir -p /root/.config/rofi
  sudo cp -r ~/giga-qarslp/dotfiles/.config/rofi/* /root/.config/rofi/
  sudo mkdir -p /root/.cache/wal
  sudo cp -r ~/.cache/wal/colors-rofi-dark.rasi /root/.cache/wal/
  xdg-settings set default-web-browser firefox.desktop 
  mkdir -p ~/.local/bin
  cp -r ~/giga-qarslp/dotfiles/.local/bin/* ~/.local/bin
  chmod +x ~/.local/bin/*
  cp ~/giga-qarslp/dotfiles/.zshrc ~/
  mkdir -p ~/.oh-my-zsh
  cp ~/giga-qarslp/dotfiles/.oh-my-zsh/themes/* ~/.oh-my-zsh/themes/
  mkdir ~/Pictures
  sudo mkdir -p /usr/share/backgrounds
  mkdir -p ~/Pictures/Wallpapers
  cp -r ~/giga-qarslp/Wallpapers/* ~/Pictures/Wallpapers
  sudo cp ~/giga-qarslp/Wallpapers/wall.jpg /usr/local/backgrounds/background.png
  sudo mkdir -p /usr/local/themes
  sudo cp -r ~/.local/share/themes/FlatColor /usr/local/themes
  sudo chown $USER:$USER /usr/local/themes/FlatColor
  sudo ln -s /usr/local/themes/FlatColor /usr/share/themes/FlatColor
  sudo mkdir /usr/local/backgrounds
  sudo chown $USER:$USER /usr/local/backgrounds
  sudo cp ~/giga-qarslp/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
}

copy_dotfiles
