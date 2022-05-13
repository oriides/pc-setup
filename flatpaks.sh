#!/bin/bash

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# setup flathub ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install packages –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak install -y flathub org.audacityteam.Audacity
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub com.github.wwmm.easyeffects
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub fr.handbrake.ghb
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.parsecgaming.parsec
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub com.github.taiko2k.tauonmb

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "flatpaks Script" "Done!"
echo "Done!"
