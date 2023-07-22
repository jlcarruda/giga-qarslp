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

## Main Objective
The root repo from gibranlp is being a source of knowledge form me. The themes are cute, but the way it loads all installation of packages and configurations are what I strive for: a fully automatic experience.

I would like to create my personal ultimate Arch ricing configuration, which in the future will be customizable for my needs, installing certain packages depending on my desire.

## Main differences between this fork and its parent
- a cute Ascii Art :D
- some base packages added (an firefox browser and vscode, for example)
- the `installer.sh` was refactored to not use `whiptail`, which gave me more headaches than the usual
- `configure.sh` as another script to automatically configure `zsh`, `xorg`, `xinit` and `wpg-install.sh` call
- moved `genwal` execution to `.xinitrc`
- refactored `copy_files.sh`, added `sudo` to necessary copies, configure of font dirs with `mkfontdir` and `OTF/TTF` fonts folder
- removed `qtile-git` and `qtile-extras-git`, which were incompatible with the python scripts for some reason
    - they were substituted by `qtile` and `qtile-extras` packages
    - I have preference for stable versions
- new theme called `giga` (WIP)
- fixed importing errors (import variables overriding each other on `functions.py`)

## Usage
After running your favorite way to install Arch (manually or via `archinstall`), you firstly will need to:

1. `pacman -S git curl`
2. Clone this repository in any directory
3. run `./installer.sh` file on this repo directory
4. profit!

### A note for `archinstall` users
This ricing setup is being tested with the following configurations:
- `minimal` installation type
- with `NetworkManager`
- audio with `pipewire`

## ROADMAP
- [ ] `lightdm` not using the greeter theme
- [ ] Fix audio source on YT videos (they are laggy and with audio messed up)
- [ ] Shortcut to change WP is not working
- [ ] change notify-send to dunstify calls
- [ ] optional installation of pentesting_packages
