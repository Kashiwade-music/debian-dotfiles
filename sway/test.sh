#!/bin/bash
sudo apt install cmake meson libwayland-bin libwayland-dev wayland-protocols libxkbcommon-dev libcairo2-dev scdoc -y
mkdir -p ./build
cd ./build
git clone https://github.com/mortie/swaylock-effects.git
cd swaylock-effects
meson build
ninja -C build
sudo ninja -C build install
sudo chmod a+s /usr/local/bin/swaylock
