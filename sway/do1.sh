#!/bin/bash
ESC=$(printf '\033')
sudo apt update

# install sway and other utils
sudo apt install sway swaylock swayidle waybar swaybg wofi grim slurp mako wob xwayland -y

# install sway build dependencies
sudo apt install cmake meson libwayland-bin libwayland-dev wayland-protocols libxkbcommon-dev libcairo2-dev scdoc -y
mkdir -p ./build
cd ./build

# install swaylock-effects
git clone https://github.com/mortie/swaylock-effects.git
cd swaylock-effects
meson build
ninja -C build
sudo ninja -C build install
sudo chmod a+s /usr/local/bin/swaylock

# install sway config
mkdir -p ~/.config/sway
find ~/.config/sway/ -name "config" | xargs rm
ln -s "$(pwd)/HOME/.config/sway/config" ~/.config/sway/config
find ~/.config/sway/ -name "inactive-windows-transparency.py" | xargs rm
cp "$(pwd)/HOME/.config/sway/inactive-windows-transparency.py" ~/.config/sway/inactive-windows-transparency.py
chmod +x ~/.config/sway/inactive-windows-transparency.py
ln -s "$(pwd)/HOME/.config/sway/inactive-windows-transparency.sh" ~/.config/sway/inactive-windows-transparency.sh
chmod +x ~/.config/sway/inactive-windows-transparency.sh

# install wofi config
mkdir -p ~/.config/wofi
find ~/.config/wofi/ -name "style" | xargs rm
find ~/.config/wofi/ -name "config" | xargs rm
ln -s "$(pwd)/HOME/.config/wofi/style.css" ~/.config/wofi/style.css
ln -s "$(pwd)/HOME/.config/wofi/config" ~/.config/wofi/config

# install waybar config
mkdir -p ~/.config/waybar
find ~/.config/waybar/ -name "config" | xargs rm
find ~/.config/waybar/ -name "style.css" | xargs rm
ln -s "$(pwd)/HOME/.config/waybar/config" ~/.config/waybar/config
ln -s "$(pwd)/HOME/.config/waybar/style.css" ~/.config/waybar/style.css

# installswaylock config
mkdir -p ~/.config/swaylock
find ~/.config/swaylock/ -name "config" | xargs rm
ln -s "$(pwd)/HOME/.config/swaylock/config" ~/.config/swaylock/config

# pip install i3ipc for autotiling
pip3 install --break-system-packages --user i3ipc

# make ~/.local/bin if not exists
mkdir -p ~/.local/bin
wget https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py -O ~/.local/bin/autotiling
chmod +x ~/.local/bin/autotiling
echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
source ~/.bashrc

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
