#!/bin/bash

if (( $EUID == 0 )); then
    echo "Don't run as root"
    exit
fi

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure git –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

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

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# install fonts –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## Powerline Symbols
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/
fc-cache -vf /usr/share/fonts/
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

## Montserrat
wget -O Montserrat.zip https://fonts.google.com/download\?family\=Montserrat
unzip Montserrat.zip -d Montserrat
rm -r Montserrat/static
sudo chown -R root:root Montserrat
sudo mv Montserrat /usr/share/fonts/

## Lexend
wget -O Lexend.zip https://fonts.google.com/download\?family\=Lexend
unzip Lexend.zip -d Lexend
rm -r Lexend/static
sudo chown -R root:root Lexend
sudo mv Lexend /usr/share/fonts/

## Space Grotesk
wget -O Space\ Grotesk.zip https://fonts.google.com/download\?family\=Space\ Grotesk
unzip Space\ Grotesk.zip -d Space\ Grotesk
rm -r Space\ Grotesk/static
sudo chown -R root:root Space\ Grotesk
sudo mv Space\ Grotesk /usr/share/fonts/

## Space Mono
wget -O Space\ Mono.zip https://fonts.google.com/download\?family\=Space\ Mono
unzip Space\ Mono.zip -d Space\ Mono
sudo chown -R root:root Space\ Mono
sudo mv Space\ Mono /usr/share/fonts/

## Meslo Nerd Font (for Powerlevel10k)
mkdir MesloLGS-NF
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O MesloLGS-NF/MesloLGS-NF-Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O MesloLGS-NF/MesloLGS-NF-Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O MesloLGS-NF/MesloLGS-NF-Bold-Italic.ttf
sudo chown -R root:root MesloLGS-NF
sudo mv MesloLGS-NF /usr/share/fonts/

## reload font cache
fc-cache -vf

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure zsh –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Powerlevel10k for oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

## zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## sets up my .zshrc
cp $(dirname $(readlink -f $0))/configs/.zshrc ~/

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# configure docker & kubernetes –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## add user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

## enable and start docker service
sudo systemctl enable docker
sudo systemctl enable containerd
sudo systemctl start docker

## enable kubelet service
sudo systemctl enable kubelet

## install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm

## configure minikube
minikube config set driver podman
minikube config set rootless true

## minikube btrfs workaround (https://github.com/kubernetes/minikube/issues/9982)
# sudo usermod -aG libvirt $USER
# sudo systemctl start libvirtd
# sudo systemctl enable libvirtd
# minikube config set rootless false
# minikube config set driver kvm2

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
# set up various configurations –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

## sets up my .vimrc
cp $(dirname $(readlink -f $0))/configs/.vimrc ~/

## install .desktop files
cp $(dirname $(readlink -f $0))/configs/desktop-files/* ~/.local/share/applications

## sets up cronjobs
sudo cp $(dirname $(readlink -f $0))/configs/cronjobs/daily/* /etc/cron.daily/
sudo chown -R root:root /etc/cron.daily
sudo systemctl enable crond.service
sudo systemctl start crond.service

## sets up (dynamic) backgrounds
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/zelda/zelda/ /usr/share/backgrounds/
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/fantasy/fantasy/ /usr/share/backgrounds/
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/desert/desert/ /usr/share/backgrounds/
sudo chown -R root:root /usr/share/backgrounds
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/zelda/zelda.xml /usr/share/gnome-background-properties/
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/fantasy/fantasy.xml /usr/share/gnome-background-properties/
sudo cp -r $(dirname $(readlink -f $0))/configs/backgrounds/desert/desert.xml /usr/share/gnome-background-properties/
sudo chown -R root:root /usr/share/gnome-background-properties


## place todo file in home directory
mv $(dirname $(readlink -f $0))/todos.md ~/

## vulkan fixes for intel graphics
echo "export LIBVA_DRIVER_NAME=iHD" >> ~/.zshrc
echo "export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json" >> ~/.zshrc

# –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

notify-send -i dialog-information "config Script" "Please reboot to apply all changes and consult the todo file in your Home Directory"

clear
notify-send -i emblem-default "config Script" "Done!"
echo "Done!"