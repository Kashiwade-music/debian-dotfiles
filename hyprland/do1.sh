#!/bin/bash
ESC=$(printf '\033')
sudo apt update

# mkdir Documents Downloads Pictures Videos Music
mkdir -p ~/Documents ~/Downloads ~/Pictures ~/Videos ~/Music

# install build dependencies
sudo apt install -y wget # for downloading files

sudo apt install -y meson       # needed for building wayland, wayland-protocols, wlroots
sudo apt install -y ninja-build # needed for building wayland, wayland-protocols, wlroots
sudo apt install -y build-essential
sudo apt install -y cmake        # needed for building hyprland
sudo apt install -y cmake-extras # needed for building hyprland

sudo apt install -y gettext                     # needed for building hyprland
sudo apt install -y gettext-base                # needed for building hyprland
sudo apt install -y fontconfig                  # needed for building hyprland
sudo apt install -y libfontconfig-dev           # needed for building hyprland
sudo apt install -y libffi-dev                  # needed for building hyprland
sudo apt install -y libxml2-dev                 # needed for building hyprland
sudo apt install -y libdrm-dev                  # needed for building hyprland
sudo apt install -y libxkbcommon-x11-dev        # needed for building hyprland
sudo apt install -y libxkbregistry-dev          # needed for building hyprland
sudo apt install -y libxkbcommon-dev            # needed for building hyprland
sudo apt install -y libpixman-1-dev             # needed for building hyprland
sudo apt install -y libudev-dev                 # needed for building hyprland
sudo apt install -y libseat-dev                 # needed for building hyprland
sudo apt install -y seatd                       # needed for building hyprland
sudo apt install -y libxcb-dri3-dev             # needed for building hyprland
sudo apt install -y libvulkan-dev               # needed for building hyprland
sudo apt install -y libvulkan-volk-dev          # needed for building hyprland
sudo apt install -y vulkan-validationlayers-dev # needed for building hyprland
sudo apt install -y libvkfft-dev                # needed for building hyprland
sudo apt install -y libgulkan-dev               # needed for building hyprland
sudo apt install -y libegl-dev                  # needed for building hyprland
sudo apt install -y libgles2                    # needed for building hyprland
sudo apt install -y libegl1-mesa-dev            # needed for building hyprland
sudo apt install -y glslang-tools               # needed for building hyprland
sudo apt install -y libinput-bin                # needed for building hyprland
sudo apt install -y libinput-dev                # needed for building hyprland
sudo apt install -y libxcb-composite0-dev       # needed for building hyprland
sudo apt install -y libavutil-dev               # needed for building hyprland
sudo apt install -y libavcodec-dev              # needed for building hyprland
sudo apt install -y libavformat-dev             # needed for building hyprland
sudo apt install -y libxcb-ewmh2                # needed for building hyprland
sudo apt install -y libxcb-ewmh-dev             # needed for building hyprland
sudo apt install -y libxcb-present-dev          # needed for building hyprland
sudo apt install -y libxcb-icccm4-dev           # needed for building hyprland
sudo apt install -y libxcb-render-util0-dev     # needed for building hyprland
sudo apt install -y libxcb-res0-dev             # needed for building hyprland
sudo apt install -y libxcb-xinput-dev           # needed for building hyprland
sudo apt install -y libpango1.0-dev             # needed for building hyprland
sudo apt install -y xdg-desktop-portal-wlr      # needed for building hyprland
sudo apt install -y hwdata-dev                  # needed for building hyprland
sudo apt install -y qt5-wayland                 # needed for building xdg-desktop-portal-hyprland
sudo apt install -y qt6-wayland                 # needed for building xdg-desktop-portal-hyprland
sudo apt install -y qt6-base-dev                # needed for building xdg-desktop-portal-hyprland
sudo apt install -y qt6-base-dev-tools          # needed for building xdg-desktop-portal-hyprland
sudo apt install -y qt6-base-private-dev        # needed for building xdg-desktop-portal-hyprland

# install wm
# clean up old build
rm -rf ./build
mkdir -p ./build

##########################
CWDIR=$(pwd)
cd ./build
##########################

# install wayland
wget https://gitlab.freedesktop.org/wayland/wayland/-/releases/1.22.0/downloads/wayland-1.22.0.tar.xz
tar -xvJf wayland-1.22.0.tar.xz
cd wayland-1.22.0
mkdir build &&
    cd build &&
    meson setup .. \
        --prefix=/usr \
        --buildtype=release \
        -Ddocumentation=false &&
    ninja
sudo ninja install
cd ../..

# install wayland-protocols
sudo apt install -y wayland-protocols
# wget https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.31/downloads/wayland-protocols-1.31.tar.xz
# tar -xvJf wayland-protocols-1.31.tar.xz
# cd wayland-protocols-1.31
# mkdir build &&
#     cd build &&
#     meson setup --prefix=/usr --buildtype=release &&
#     ninja
# sudo ninja install
# cd ../..

# install libdisplay-info
# sudo apt install -y libdisplay-info-dev
wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
tar -xvJf libdisplay-info-0.1.1.tar.xz
cd libdisplay-info-0.1.1/
mkdir build &&
    cd build &&
    meson setup --prefix=/usr --buildtype=release &&
    ninja
sudo ninja install
cd ../..

# install hyprland
wget https://github.com/hyprwm/Hyprland/releases/download/v0.26.0/source-v0.26.0.tar.gz
tar -xvf source-v0.26.0.tar.gz
chmod a+rw hyprland-source
cd hyprland-source/
sed -i 's/\/usr\/local/\/usr/g' config.mk
sudo make install
cd ../..

# install xdg-desktop-portal-hyprland
wget -O xdg-desktop-portal-hyprland https://github.com/hyprwm/xdg-desktop-portal-hyprland/archive/refs/tags/v0.4.0.tar.gz
tar -xvf xdg-desktop-portal-hyprland
cd xdg-desktop-portal-hyprland-0.4.0
meson build --prefix=/usr
ninja -C build
cd hyprland-share-picker && make all && cd ..
ninja -C build install
sudo cp ./hyprland-share-picker/build/hyprland-share-picker /usr/bin

##########################
cd $CWDIR
##########################

# install other utils
sudo apt install -y mako     # notification daemon
sudo apt install -y pipewire # screensharing
sudo apt install swaylock swayidle waybar swaybg wofi grim slurp wob xwayland -y

# install sway config
## mkdir -p ~/.config/sway
## find ~/.config/sway/ -name "config" | xargs rm
## ln -s "$(pwd)/HOME/.config/sway/config" ~/.config/sway/config
## find ~/.config/sway/ -name "inactive-windows-transparency.py" | xargs rm
## cp "$(pwd)/HOME/.config/sway/inactive-windows-transparency.py" ~/.config/sway/inactive-windows-transparency.py
## chmod +x ~/.config/sway/inactive-windows-transparency.py
## ln -s "$(pwd)/HOME/.config/sway/inactive-windows-transparency.sh" ~/.config/sway/inactive-windows-transparency.sh
## chmod +x ~/.config/sway/inactive-windows-transparency.sh

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

# install swaylock config
mkdir -p ~/.config/swaylock
find ~/.config/swaylock/ -name "config" | xargs rm
ln -s "$(pwd)/HOME/.config/swaylock/config" ~/.config/swaylock/config

# pip install i3ipc for autotiling
## pip3 install --break-system-packages --user i3ipc

# make ~/.local/bin if not exists
# mkdir -p ~/.local/bin
# wget https://raw.githubusercontent.com/nwg-piotr/autotiling/master/autotiling/main.py -O ~/.local/bin/autotiling
# chmod +x ~/.local/bin/autotiling
# echo 'export PATH="$HOME/.local/bin:$PATH"' >>~/.bashrc
# source ~/.bashrc
