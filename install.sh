#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

################################################################################
### install ansible

notify-send -i dialog-information "Prerequisites…" "Installing Ansible…"

sudo dnf install -y ansible

################################################################################
### get git credentials

source ./scripts/git-config-variables.sh

################################################################################
### run ansible playbook

notify-send -i dialog-information "Starting installation…" "Running Ansible Playbook…"

ansible-galaxy collection install community.general
ansible-playbook site.yml --inventory inventory --ask-become-pass


################################################################################

notify-send -i dialog-information "Installation finished!" "Please reboot to apply all changes.\nAfterwards consult the todos.md file in your home directory for further steps"
