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
### configure git

notify-send -i dialog-information "Configuring git…" "Please provide you username and email"

./scripts/git-config.sh

################################################################################
### run ansible playbook

notify-send -i dialog-information "Starting installation…" "Running Ansible Playbook…"

ansible-galaxy collection install community.general
ansible-playbook site.yml -i inventory --ask-become-pass

################################################################################
### configure oh-my-zsh

notify-send -i dialog-information "Configuring oh-my-zsh…" "Installing plugins and themes…"

./scripts/zsh-config.sh

################################################################################

notify-send -i dialog-information "Installation finished!" "Please reboot to apply all changes.\nAfterwards consult the todos.md file in your home directory for further steps"