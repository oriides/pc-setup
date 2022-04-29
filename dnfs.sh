#!/bin/bash

# Setup repositories
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update

sudo dnf install -y code 				                # vscode
sudo dnf install -y evolution 				            # mail client
sudo dnf install -y ffmpeg				                # AV transcoder
sudo dnf install -y file-roller file-roller-nautilus 	# archive manager
sudo dnf install -y java-latest-openjdk              	# java openjdk
sudo dnf install -y neofetch                            # systeminfo
sudo dnf install -y openssl                             # ssl
sudo dnf install -y steam                               # steam
sudo dnf install -y zsh                                 # zsh
