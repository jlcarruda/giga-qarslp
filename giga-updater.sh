#!/usr/bin/env bash
#
#  ______  ______  ______   ______       _______  ______  ______  ______ __    __  ______  
# /      \|      \/      \ /      \     |       \|      \/      \|      \  \  |  \/      \  
#|  ▓▓▓▓▓▓\\▓▓▓▓▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\    | ▓▓▓▓▓▓▓\\▓▓▓▓▓▓  ▓▓▓▓▓▓\\▓▓▓▓▓▓ ▓▓\ | ▓▓  ▓▓▓▓▓▓\ 
#| ▓▓ __\▓▓ | ▓▓ | ▓▓ __\▓▓ ▓▓__| ▓▓    | ▓▓__| ▓▓ | ▓▓ | ▓▓   \▓▓ | ▓▓ | ▓▓▓\| ▓▓ ▓▓ __\▓▓ 
#| ▓▓|    \ | ▓▓ | ▓▓|    \ ▓▓    ▓▓    | ▓▓    ▓▓ | ▓▓ | ▓▓       | ▓▓ | ▓▓▓▓\ ▓▓ ▓▓|    \ 
#| ▓▓ \▓▓▓▓ | ▓▓ | ▓▓ \▓▓▓▓ ▓▓▓▓▓▓▓▓    | ▓▓▓▓▓▓▓\ | ▓▓ | ▓▓   __  | ▓▓ | ▓▓\▓▓ ▓▓ ▓▓ \▓▓▓▓ 
#| ▓▓__| ▓▓_| ▓▓_| ▓▓__| ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓_| ▓▓_| ▓▓__/  \_| ▓▓_| ▓▓ \▓▓▓▓ ▓▓__| ▓▓ 
# \▓▓    ▓▓   ▓▓ \\▓▓    ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓   ▓▓ \\▓▓    ▓▓   ▓▓ \ ▓▓  \▓▓▓\▓▓    ▓▓ 
#  \▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓     \▓▓   \▓▓\▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓▓▓▓▓\▓▓   \▓▓ \▓▓▓▓▓▓  
#
# 
#                                                    - jlcarruda
#                                                      Inspired by @gibranlp ricing: QARSlp

function reset_dotfiles(){
    TMP_RICING="/tmp/.ricing"
    mkdir -p $TMP_RICING
    cp -r . $TMP_RICING

    cp $TMP_RICING/dotfiles/.gitconfig ~
    cp $TMP_RICING/dotfiles/.zshrc ~
    cp $TMP_RICING/dotfiles/.xprofile ~
    cp $TMP_RICING/dotfiles/.profile ~
    cp $TMP_RICING/dotfiles/.local/bin/calculator ~/.local/bin
    cp $TMP_RICING/dotfiles/.local/bin/calendar ~/.local/bin
    cp $TMP_RICING/dotfiles/.local/bin/notesfi ~/.local/bin
    cp $TMP_RICING/dotfiles/.local/bin/recorder ~/.local/bin
    cp $TMP_RICING/dotfiles/.local/bin/selectwal ~/.local/bin
    sudo mkdir -p /usr/share/lightdm/lightdm.conf.d
    sudo cp $TMP_RICING/dotfiles/lightdm/lightdm-gtk-greeter.conf /usr/share/lightdm/lightdm.conf.d/lightdm-gtk-greeter.conf
    cp $TMP_RICING/dotfiles/.gitconfig ~

    cp -r $TMP_RICING/dotfiles/.config/qtile/* ~/.config/qtile

    rm -rf $TMP_RICING
}

reset_dotfiles
