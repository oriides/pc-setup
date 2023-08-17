#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

################################################################################
### configure git

## git user.name
if ! NAME=$(zenity --entry --title "git User Name" --text "Please enter your name (Firstname Lastname):"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Name to continue"
  exit;
fi

## git user.email
if ! EMAIL=$(zenity --entry --title "git User Email" --text "Please enter your Email adress:"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
  exit;
fi

## globally sets git username and email
git config --global user.name "$NAME"
git config --global user.email $EMAIL

## set default pull/rebase strategy
git config --global pull.rebase true
