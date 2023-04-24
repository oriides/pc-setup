#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# prepare sub-scripts

sudo chmod +x ./scripts

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# run sub-scripts

scripts/prerequisites.sh && \
notify-send -i emblem-default "Step 1/5" "Prepared system for installation" && \
scripts/dnfs.sh && \
notify-send -i emblem-default "Step 2/5" "Finished installing system applications (dnf packages)" && \
scripts/flatpaks.sh && \
notify-send -i emblem-default "Step 3/5" "Finished installing user applications (flatpak apps)" && \
scripts/cargo.sh && \
notify-send -i emblem-default "Step 4/5" "Finished installing Rust and Cargo apps" && \
scripts/config.sh && \
notify-send -i emblem-default "Step 5/5" "Finished configuration of system" && \
notify-send -i dialog-information "Installation Script" "Done! Please reboot to apply all changes.\nAfterwards consult the todos.md file in your home directory for further steps"
