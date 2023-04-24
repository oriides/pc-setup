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

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install packages ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

sudo dnf install -y code                                    # Visual Studio Code
sudo dnf install -y cronie                                  # crond
sudo dnf install -y docker-ce docker-ce-cli containerd.io   # docker
sudo dnf install -y docker-compose-plugin                   # docker
sudo dnf install -y evolution 				                # Evolution Mail Client
sudo dnf install -y ffmpeg				                    # AV transcoder
sudo dnf install -y file-roller file-roller-nautilus        # archive manager
sudo dnf install -y gnome-tweaks                            # gnome tweaks
sudo dnf install -y google-chrome-stable                    # Google Chrome
sudo dnf install -y gstreamer1-vaapi                        # GStreamer plugins to use VAAPI
sudo dnf install -y gti 	                                # git launcher
sudo dnf install -y helm                                    # helm kubernetes package manager
sudo dnf install -y intel-media-driver                      # Intel VAAPI driver
sudo dnf install -y intel-gpu-tools                         # Intel Graphics tools
sudo dnf install -y java-latest-openjdk                     # java openjdk
sudo dnf install -y kubernetes                              # kubernetes
sudo dnf install -y kompose                                 # docker compose to kubernetes converter
sudo dnf install -y latexmk                                 # latex
sudo dnf install -y libgda libgda-sqlite                    # deps for Pano Clipboard Manager
sudo dnf install -y libheif                                 # HEIC/HEIF support
sudo dnf install -y libva libva-utils                       # Video Acceleration (VAAPI)
sudo dnf install -y mesa-dri-drivers                        # Mesa-based DRI drivers
sudo dnf install -y mesa-va-drivers                         # Mesa-based VAAPI drivers
sudo dnf install -y mesa-vdpau-drivers                      # Mesa-based VDPAU drivers
sudo dnf install -y mesa-vulkan-drivers                     # Mesa Vulkan drivers
sudo dnf install -y neofetch                                # systeminfo
sudo dnf install -y nodejs                                  # nodejs
sudo dnf install -y openssl                                 # ssl
sudo dnf install -y powerline vim-powerline                 # powerline
sudo dnf install -y seahorse                                # key manager
sudo dnf install -y solaar                                  # logitech peripheral manager
sudo dnf install -y texlive                                 # latex
sudo dnf install -y texlive-collection-langgerman           # latex
sudo dnf install -y texlive-collection-latexextra           # latex
sudo dnf install -y texlive-latexindent                     # latex
sudo dnf install -y zsh                                     # zsh
sudo dnf install -y @virtualization                         # supplementary virtualization programs

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "dnf Script" "Done!"
echo "Done!"