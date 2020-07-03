#!/bin/bash

LANG=C xdg-user-dirs-gtk-update

sudo apt update
sudo apt install fcitx-mozc
im-config

#snap
sudo apt update
sudo apt -y install snapd

echo "please reboot"