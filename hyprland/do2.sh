#!/bin/bash

ESC=$(printf '\033')
sudo apt-get update

# ==============================================================
# =                  INSTALL NON-WM SOFTWARES                  =
# ==============================================================

# Install fcitx-mozc
# Uninstall ibus to prevent fcitx and ibus from fighting with each other.
sudo apt-get -y install fcitx-mozc
sudo apt-get -y purge ibus

echo "${ESC}[34mSTEP: Set input method to fcitx ${ESC}[m"
im-config

sudo apt-get -y install snapd curl

sudo reboot
