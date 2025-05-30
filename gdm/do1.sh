#!/bin/bash
ESC=$(printf '\033')
sudo apt update

# Englishize folder names
echo "${ESC}[34mSTEP: Englishize folder names ${ESC}[m"
LANG=C xdg-user-dirs-gtk-update

# Install fcitx5-mozc
# Uninstall ibus to prevent fcitx5 and ibus from fighting with each other.
sudo apt -y install fcitx5-mozc
sudo apt -y purge ibus

echo "${ESC}[34mSTEP: Set input method to fcitx5 ${ESC}[m"
im-config

sudo apt -y install snapd curl

# git clone to Documents
cd ~/Documents
git clone https://github.com/Kashiwade-music/debian-dotfiles.git
rm -rf ~/ドキュメント

sudo reboot
