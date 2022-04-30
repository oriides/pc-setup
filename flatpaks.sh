#!/bin/bash

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# setup flathub ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install packages –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak install -y org.audacityteam.Audacity
flatpak install -y com.bitwarden.desktop
flatpak install -y com.discordapp.Discord
flatpak install -y com.github.wwmm.easyeffects
flatpak install -y com.github.tchx84.Flatseal
flatpak install -y org.gimp.GIMP
flatpak install -y fr.handbrake.ghb
flatpak install -y com.obsproject.Studio
flatpak install -y org.onlyoffice.desktopeditors
flatpak install -y com.parsecgaming.parsec
flatpak install -y com.spotify.Client
flatpak install -y com.github.taiko2k.tauonmb

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "flatpaks Script" "Done!"
echo "Done!"
