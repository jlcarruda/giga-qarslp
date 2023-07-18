./ascii-art.sh
echo "#################################################"
echo "#############  CONFIGURE ########################"
echo "###################### RICE #####################"
echo "##### omzsh, qtile, dotfiles and stuff ##########"
echo "#################################################"
sleep 2

## Install oh-my-zsh
if ! [ -x "$(command -v zsh)" ]; then
  echo "====== Installing ohmyzsh ========"
  h -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi

## Configure X server
Xorg :0 -configure
sudo cp $HOME/xorg.conf.new /etc/X11/xorg.conf
rm $HOME/xorg.conf.new

## copy XInitRC to home
cp ./dotfiles/.xinitrc ~/.xinitrc

## Configure pywal and move default wallpaper to Pictures folder
#mkdir -p ~/Pictures/Wallpapers
#cp ./wps/wall.jpg ~/Pictures/Wallpapers
#pywal -i ~/Pictures/Wallpapers

## install qtile-extras
mkdir -p /tmp/.ricing/qtile-extras
curl https://raw.githubusercontent.com/elParaguayo/qtile-extras/main/PKGBUILD >> /tmp/.ricing/qtile-extras/PKGBUILD
cd /tmp/.ricing/qtile-extras && makepkg -sci

## add local bin to PATH
export PATH=$PATH:$HOME/.local/bin

## Execute wpg-install and genwal
wpg-install.sh -gio
genwal