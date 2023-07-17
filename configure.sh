../ascii-art.sh
echo "#################################################"
echo "#############  CONFIGURE ########################"
echo "###################### RICE #####################"
echo "##### omzsh, qtile, dotfiles and stuff ##########"
echo "#################################################"
sleep 1

## Install oh-my-zsh
if ! [ -x "$(command -v zsh)" ]; then
  h -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

## Configure XORG
Xorg :0 -configure
sudo cp $HOME/xorg.conf.new /etc/X11/xorg.conf

## copy XInitRC to home
cp ./dotfiles/.xinitrc ~/.xinitrc

## configure font dir
mkfontdir -e /usr/share/fonts/TTF

## Configure pywal and move default wallpaper to Pictures folder
#mkdir -p ~/Pictures/Wallpapers
#cp ./wps/wall.jpg ~/Pictures/Wallpapers
#pywal -i ~/Pictures/Wallpapers

## install qtile-extras
mkdir -p ~/.ricing/qtile-extras
curl https://raw.githubusercontent.com/elParaguayo/qtile-extras/main/PKGBUILD >> ~/.ricing/qtile-extras/PKGBUILD
cd ~/.ricing/qtile-extras && makepkg -sci

