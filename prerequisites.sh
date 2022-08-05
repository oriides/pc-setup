#!/bin/bash

# configure dnf
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=8" >> /etc/dnf/dnf.conf
sudo echo "defaultyes=True" >> /etc/dnf/dnf.conf

# update system
sudo dnf update

# enable rpm fusion
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install media codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# install nvidia drivers
#sudo dnf install akmod-nvidia
#sudo dnf install xorg-x11-drv-nvidia-cuda
