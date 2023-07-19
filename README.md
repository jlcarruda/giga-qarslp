<!--
#  ______  ______  ______   ______       _______  ______  ______  ______ __    __  ______  
 /      \|      \/      \ /      \     |       \|      \/      \|      \  \  |  \/      \ 
|  ▓▓▓▓▓▓\\▓▓▓▓▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\    | ▓▓▓▓▓▓▓\\▓▓▓▓▓▓  ▓▓▓▓▓▓\\▓▓▓▓▓▓ ▓▓\ | ▓▓  ▓▓▓▓▓▓\
| ▓▓ __\▓▓ | ▓▓ | ▓▓ __\▓▓ ▓▓__| ▓▓    | ▓▓__| ▓▓ | ▓▓ | ▓▓   \▓▓ | ▓▓ | ▓▓▓\| ▓▓ ▓▓ __\▓▓
| ▓▓|    \ | ▓▓ | ▓▓|    \ ▓▓    ▓▓    | ▓▓    ▓▓ | ▓▓ | ▓▓       | ▓▓ | ▓▓▓▓\ ▓▓ ▓▓|    \
| ▓▓ \▓▓▓▓ | ▓▓ | ▓▓ \▓▓▓▓ ▓▓▓▓▓▓▓▓    | ▓▓▓▓▓▓▓\ | ▓▓ | ▓▓   __  | ▓▓ | ▓▓\▓▓ ▓▓ ▓▓ \▓▓▓▓
| ▓▓__| ▓▓_| ▓▓_| ▓▓__| ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓_| ▓▓_| ▓▓__/  \_| ▓▓_| ▓▓ \▓▓▓▓ ▓▓__| ▓▓
 \▓▓    ▓▓   ▓▓ \\▓▓    ▓▓ ▓▓  | ▓▓    | ▓▓  | ▓▓   ▓▓ \\▓▓    ▓▓   ▓▓ \ ▓▓  \▓▓▓\▓▓    ▓▓
  \▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓     \▓▓   \▓▓\▓▓▓▓▓▓ \▓▓▓▓▓▓ \▓▓▓▓▓▓\▓▓   \▓▓ \▓▓▓▓▓▓ 
                                                                                          
                                                                                                                                                                              
#                                                    - jlcarruda
#                                                      Inspired by @gibranlp ricing: QARSlp
-->
# Giga Ricing
A custom [Qtile](http://www.qtile.org/) setup for my Arch ricing. This repo is a fork from [gibranlp's QARSlp repo](https://github.com/gibranlp/QARSlp). 

## Main differences between this fork and its parent
- a cute Ascii Art :D
- some base packages added (an opera browser, for example)
- the `installer.sh` was refactored to not use `whiptail`, which gave me more headaches than the usual
- `configure.sh` as another script to automatically configure `zsh`, `xorg`, `xinit` and `wpg-install.sh` call
- moved `genwal` execution to `.xinitrc`
- refactored `copy_files.sh`, added `sudo` to necessary copies, configure of font dirs with `mkfontdir` and `OTF/TTF` fonts folder
- removed `qtile-git` and `qtile-extras-git`, which were incompatible with the python scripts for some reason
    - they were substituted by `qtile` and `qtile-extras` packages
- new profile called `giga` (WIP)
- fixed importing errors (import variables overriding each other on `functions.py`)

## Usage
After runnig your favorite way to install arch (manually or via `archinstall`), you firstly will need to install `git`.

1. `pacman -S git`
2. Clone this repository in any directory
3. run `./installer.sh` file on this repo directory
4. profit!