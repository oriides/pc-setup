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

flatpak install -y flathub io.bassi.Amberol                             # Amberol
flatpak install -y flathub org.audacityteam.Audacity                    # Audacity
flatpak install -y flathub com.bitwarden.desktop                        # Bitwarden
flatpak install -y flathub org.blender.Blender                          # Blender
flatpak install -y flathub com.usebottles.bottles                       # Bottles
flatpak install -y flathub com.github.rafostar.Clapper                  # Clapper
flatpak install -y flathub ca.desrt.dconf-editor                        # dconf Editor
# flatpak install -y flathub com.discordapp.Discord                       # Discord
flatpak install -y flathub me.dusansimic.DynamicWallpaper               # Dynamic Wallpaper Generator
flatpak install -y flathub com.github.wwmm.easyeffects                  # Easy Effects
flatpak install -y flathub com.mattjakeman.ExtensionManager             # Extension Manager
flatpak install -y flathub org.gnome.Firmware                           # Firmware
flatpak install -y flathub com.github.tchx84.Flatseal                   # Flatseal
flatpak install -y flathub org.gimp.GIMP                                # GIMP
flatpak install -y flathub fr.handbrake.ghb                             # Handbrake
flatpak install -y flathub fr.handbrake.ghb.Plugin.IntelMediaSDK        # Handbrake Plugin (Intel QSV)
flatpak install -y flathub org.inkscape.Inkscape                        # Inkscape 
flatpak install -y flathub org.gnome.PowerStats                         # Power Statistics
flatpak install -y flathub com.obsproject.Studio                        # OBS
flatpak install -y flathub com.obsproject.Studio.Plugin.Gstreamer       # OBS Plugin
flatpak install -y flathub com.obsproject.Studio.Plugin.MoveTransition  # OBS Plugin
flatpak install -y flathub org.onlyoffice.desktopeditors                # OnlyOffice
flatpak install -y flathub com.parsecgaming.parsec                      # Parsec
flatpak install -y flathub com.valvesoftware.Steam                      # Steam
flatpak install -y flathub com.valvesoftware.Steam.CompatibilityTool.Proton-GE # Steam Plugin (Proton GE)
flatpak install -y flathub org.videolan.VLC                             # VLC
flatpak install -y flathub io.github.mimbrero.WhatsAppDesktop           # WhatsApp

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

clear
notify-send -i emblem-default "flatpaks Script" "Done!"
echo "Done!"
