#!/bin/bash
ESC=$(printf '\033')
sudo apt update

# mkdir Documents Downloads Pictures Videos Music
mkdir -p ~/Documents ~/Downloads ~/Pictures ~/Videos ~/Music

# install build dependencies
sudo apt install -y wget \
    build-essential

# needed for building wayland, wayland-protocols, wlroots, hyprland(cmake)
sudo apt install -y meson \
    ninja-build \
    cmake \
    cmake-extras

# needed for building xcb-errors (it is a dependency of wlroots)
sudo apt install -y dh-autoreconf \
    xutils-dev \
    xcb-proto

# needed for building hyprland
sudo apt install -y gettext \
    gettext-base \
    fontconfig \
    libfontconfig-dev \
    libffi-dev \
    libxml2-dev \
    libdrm-dev \
    libgbm-dev \
    libxkbcommon-x11-dev \
    libxkbregistry-dev \
    libxkbcommon-dev \
    libpixman-1-dev \
    libudev-dev \
    libseat-dev \
    seatd \
    libxcb-dri3-dev \
    libvulkan-dev \
    libvulkan-volk-dev \
    vulkan-validationlayers-dev \
    libvkfft-dev \
    libgulkan-dev \
    libegl-dev \
    libgles2 \
    libegl1-mesa-dev \
    glslang-tools \
    libinput-bin \
    libinput-dev \
    libxcb-composite0-dev \
    libavutil-dev \
    libavcodec-dev \
    libavformat-dev \
    libxcb-ewmh2 \
    libxcb-ewmh-dev \
    libxcb-present-dev \
    libxcb-icccm4-dev \
    libxcb-render-util0-dev \
    libxcb-res0-dev \
    libxcb-xinput-dev \
    libpango1.0-dev \
    hwdata \
    edid-decode

# needed for building xdg-desktop-portal-hyprland
sudo apt install -y qt6-wayland \
    qt6-base-dev \
    qt6-base-dev-tools \
    qt6-base-private-dev \
    libpipewire-0.3-dev \
    libinih-dev \
    libsystemd-dev

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
cd $CWDIR/build

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
# (dependency of hyprland)
# sudo apt install -y libdisplay-info-dev
wget https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.1.1/downloads/libdisplay-info-0.1.1.tar.xz
tar -xvJf libdisplay-info-0.1.1.tar.xz
cd libdisplay-info-0.1.1/
mkdir build &&
    cd build &&
    meson setup --prefix=/usr --buildtype=release &&
    ninja
sudo ninja install
cd $CWDIR/build

# install libliftoff
# (dependency of wlroot)
wget -O libliftoff.tar.gz https://gitlab.freedesktop.org/emersion/libliftoff/-/archive/v0.4.1/libliftoff-v0.4.1.tar.gz
tar -xvf libliftoff.tar.gz
cd libliftoff-v0.4.1
meson setup build/
ninja -C build/
sudo ninja -C build/ install
cd $CWDIR/build

# install xcb-errors
# (dependency of wlroot)
git clone https://gitlab.freedesktop.org/xorg/lib/libxcb-errors.git --recursive
cd libxcb-errors
./autogen.sh
./configure --prefix=/usr
make
sudo make install
cd $CWDIR/build

# install hyprland
wget https://github.com/hyprwm/Hyprland/releases/download/v0.26.0/source-v0.26.0.tar.gz
tar -xvf source-v0.26.0.tar.gz
chmod a+rw hyprland-source
cd hyprland-source/
sed -i 's/\/usr\/local/\/usr/g' config.mk
sudo make install
cd $CWDIR/build

# install hyprland-protocols
# (dependency of xdg-desktop-portal-hyprland)
wget -O hyprland-protocols.tar.gz https://github.com/hyprwm/hyprland-protocols/archive/refs/tags/v0.2.tar.gz
tar -xvf hyprland-protocols.tar.gz
cd hyprland-protocols-0.2
mkdir build &&
    cd build &&
    meson setup --prefix=/usr --buildtype=release &&
    ninja
sudo ninja install
cd $CWDIR/build

# install xdg-desktop-portal-hyprland
wget -O xdg-desktop-portal-hyprland.tar.gz https://github.com/hyprwm/xdg-desktop-portal-hyprland/archive/refs/tags/v0.4.0.tar.gz
tar -xvf xdg-desktop-portal-hyprland.tar.gz
cd xdg-desktop-portal-hyprland-0.4.0
meson build --prefix=/usr
ninja -C build
cd hyprland-share-picker && make all && cd ..
ninja -C build install
sudo cp ./hyprland-share-picker/build/hyprland-share-picker /usr/bin
cd $CWDIR/build

# install waybar
git clone https://github.com/Alexays/Waybar.git
cd Waybar
sed -i -e 's/zext_workspace_handle_v1_activate(workspace_handle_);/const std::string command = "hyprctl dispatch workspace " + name_;\n\tsystem(command.c_str());/g' src/modules/wlr/workspace_manager.cpp
meson --prefix=/usr --buildtype=plain --auto-features=enabled --wrap-mode=nodownload build
meson configure -Dexperimental=true build
sudo ninja -C build install
cd $CWDIR/build

# install hyprpaper
git clone https://github.com/hyprwm/hyprpaper.git
cd hyprpaper
sudo make install
cd $CWDIR/build

##########################
cd $CWDIR
##########################

# install other utils
sudo apt install -y mako     # notification daemon
sudo apt install -y pipewire # screensharing
sudo apt install swaylock swayidle swaybg wofi grim slurp wob xwayland -y

# install sway config
## mkdir -p ~/.config/sway
## find ~/.config/sway/ -name "config" | xargs rm
## ln -s "$(pwd)/HOME/.config/sway/config" ~/.config/sway/config
## find ~/.config/sway/ -name "inactive-windows-transparency.py" | xargs rm
## cp "$(pwd)/HOME/.config/sway/inactive-windows-transparency.py" ~/.config/sway/inactive-windows-transparency.py
## chmod +x ~/.config/sway/inactive-windows-transparency.py
## ln -s "$(pwd)/HOME/.config/sway/inactive-windows-transparency.sh" ~/.config/sway/inactive-windows-transparency.sh
## chmod +x ~/.config/sway/inactive-windows-transparency.sh

# install hyprland config
mkdir -p ~/.config/hyprland
find ~/.config/hyprland/ -name "conf" | xargs rm
ln -s "$(pwd)/HOME/.config/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
ln -s "$(pwd)/HOME/.config/hypr/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf

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
