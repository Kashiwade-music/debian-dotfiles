#!/bin/bash
ESC=$(printf '\033')
sudo apt update

echo "${ESC}[34mSTEP: Set input method as follows.${ESC}[m"
echo "${ESC}[34mキーボード - 日本語        日本語${ESC}[m"
echo "${ESC}[34mmozc                       日本語${ESC}[m"
fcitx-config-gtk3

echo "${ESC}[34mSTEP: Make sure that certain characters are input in half-width characters even in Japanese input mode.${ESC}[m"
/usr/lib/mozc/mozc_tool --mode=config_dialog

# Install Programs
# gnome extension host connector
sudo apt -y install chrome-gnome-shell

# neofetch
sudo apt -y install neofetch

# git
sudo apt -y install git

# vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt -y install vivaldi-stable

# VSCode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y code

# Postman
sudo snap install postman

# Syncthing
sudo curl -s -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install -y syncthing

# Docker
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# If the latest codename for debian stable is not "bullseye", then change the code below.
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io

# dconf-editor
sudo apt -y install dconf-editor

# Settings
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Shift><Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Primary><Alt>f']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>t"

gsettings set org.gnome.shell favorite-apps "['code.desktop', 'vivaldi-stable.desktop', 'org.gnome.Terminal.desktop', 'gnome-control-center.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'org.gnome.tweaks.desktop', 'syncthing-ui.desktop']"

gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

xdg-settings set default-web-browser vivaldi-stable.desktop

mkdir ~/.config/autostart/
cp ./forCopy/syncthing-start.desktop ~/.config/autostart/
sudo apt autoremove -y
echo "${ESC}[34mConfiguration finished${ESC}[m"