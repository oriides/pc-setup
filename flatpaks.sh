#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# setup flathub –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install packages ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

flatpak install -y flathub io.bassi.Amberol
flatpak install -y flathub org.audacityteam.Audacity
flatpak install -y flathub com.bitwarden.desktop
flatpak install -y flathub com.github.rafostar.Clapper
flatpak install -y flathub ca.desrt.dconf-editor
flatpak install -y flathub com.discordapp.Discord
flatpak install -y flathub me.dusansimic.DynamicWallpaper
flatpak install -y flathub com.github.wwmm.easyeffects
flatpak install -y flathub com.mattjakeman.ExtensionManager
flatpak install -y flathub org.gnome.Firmware
flatpak install -y flathub com.github.tchx84.Flatseal
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub fr.handbrake.ghb
flatpak install -y flathub org.gnome.PowerStats
flatpak install -y flathub com.obsproject.Studio
flatpak install -y flathub com.obsproject.Studio.Plugin.Gstreamer
flatpak install -y flathub com.obsproject.Studio.Plugin.MoveTransition
flatpak install -y flathub org.onlyoffice.desktopeditors
flatpak install -y flathub com.parsecgaming.parsec
flatpak install -y flathub com.valvesoftware.Steam
flatpak install -y flathub com.valvesoftware.Steam.CompatibilityTool.Proton-GE
# flatpak install -y flathub com.github.taiko2k.tauonmb

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "flatpaks Script" "Done!"
echo "Done!"
