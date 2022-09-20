#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# setup repositories ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install packages ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo dnf install -y code 				                # vscode
sudo dnf install -y evolution 				            # mail client
sudo dnf install -y ffmpeg				                # AV transcoder
sudo dnf install -y file-roller file-roller-nautilus 	# archive manager
sudo dnf install -y gnome-tweaks                        # gnome tweaks
sudo dnf install -y google-chrome-stable                # Google Chrome
sudo dnf install -y gti 	                            # git launcher
sudo dnf install -y java-latest-openjdk              	# java openjdk
sudo dnf install -y latexmk                             # latex
sudo dnf install -y libheif                             # HEIC/HEIF support
sudo dnf install -y neofetch                            # systeminfo
sudo dnf install -y nodejs                              # nodejs
sudo dnf install -y openssl                             # ssl
sudo dnf install -y powerline vim-powerline             # powerline
sudo dnf install -y seahorse                            # key manager
sudo dnf install -y texlive                             # latex
sudo dnf install -y texlive-collection-langgerman       # latex
sudo dnf install -y texlive-collection-latexextra       # latex
sudo dnf install -y translate-shell                     # Ulanucher Translate dependency
sudo dnf install -y ulauncher                           # application launcher
sudo dnf install -y zsh                                 # zsh

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "dnf Script" "Done!"
echo "Done!"