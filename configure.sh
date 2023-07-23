./ascii-art.sh
echo "#################################################"
echo "#############  CONFIGURE ########################"
echo "###################### RICE #####################"
echo "##### omzsh, qtile, dotfiles and stuff ##########"
echo "#################################################"
sleep 2

## Install oh-my-zsh
echo "====== Installing ohmyzsh ========"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

## Configure X server
Xorg :0 -configure
sudo cp $HOME/xorg.conf.new /etc/X11/xorg.conf
rm $HOME/xorg.conf.new

## copy XInitRC to home
cp ./dotfiles/.xinitrc ~/.xinitrc

## add local bin to PATH
sudo export PATH=$PATH:$HOME/.local/bin

su systemctl enable ligthdm.service --now

## Execute wpg-install
wpg-install.sh -gio
genwal

## enable lightdm
sudo systemctl enable lightdm.service --now