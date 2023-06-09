#!/bin/bash
ESC=$(printf '\033')
sudo apt update

# Englishize folder names
echo "${ESC}[34mSTEP: Englishize folder names ${ESC}[m"
LANG=C xdg-user-dirs-gtk-update

# Install fcitx-mozc
# Uninstall ibus to prevent fcitx and ibus from fighting with each other.
sudo apt -y install fcitx-mozc
sudo apt -y purge ibus 

echo "${ESC}[34mSTEP: Set input method to fcitx ${ESC}[m"
im-config


sudo apt -y install snapd curl
sudo reboot