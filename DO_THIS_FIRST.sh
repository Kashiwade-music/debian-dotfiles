#!/bin/bash

LANG=C xdg-user-dirs-gtk-update

sudo apt update
sudo apt -y install fcitx-mozc
im-config

#snap
sudo apt update
sudo apt -y install snapd

#curl
sudo apt update
sudo apt -y install curl

echo "please reboot"