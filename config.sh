#!/bin/bash

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure git ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## git user.name
if ! NAME=$(zenity --entry --title "GIT User Name" --text "Please enter your name (Firstname Lastname):"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Name to continue"
  exit;
fi

## git user.email
if ! EMAIL=$(zenity --entry --title "GIT User Email" --text "Please enter your Email adress:"); then
  notify-send -i dialog-error "Aborting..." "Please enter your Email to continue"
  exit;
fi

## globally sets git username and email
git config --global user.name $NAME
git config --global user.email $EMAIL

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# set up various configurations ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## sets up vim
cp $(dirname $(readlink -f $0))/configs/.vimrc ~/

## install .desktop files
cp $(dirname $(readlink -f $0))/configs/desktop-files/* ~/.local/share/applications

# ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install fonts ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## Montserrat
wget -O Montserrat.zip https://fonts.google.com/download\?family\=Montserrat
unzip Montserrat.zip -d Montserrat
sudo chown -R root:root Montserrat
sudo mv Montserrat /usr/share/fonts/truetype/
fc-cache -vf

## Powerline Symbols
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

## Meslo Nerd Font (for Powerlevel10k)
mkdir MesloLGS-NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloLGS-NF/MesloLGS-NF-Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloLGS-NF/MesloLGS-NF-Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Bold-Italic.ttf
sudo chown -R root:root MesloLGS-NF
sudo mv MesloLGS-NF /usr/share/fonts/truetype/
fc-cache -vf
