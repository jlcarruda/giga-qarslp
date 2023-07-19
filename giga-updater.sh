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
    cp $TMP_RICING/dotfiles/.local/bin/calculator
    cp $TMP_RICING/dotfiles/.local/bin/calendar
    cp $TMP_RICING/dotfiles/.local/bin/notesfi
    cp $TMP_RICING/dotfiles/.local/bin/recorder
    cp $TMP_RICING/dotfiles/.local/bin/selectwal

    cp -r $TMP_RICING/dotfiles/.config/qtile/* ~/.config/qtile

    rm -rf $TMP_RICING
}

reset_dotfiles