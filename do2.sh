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
echo "${ESC}[34m------------gnome extension host connentor------------${ESC}[m"
sudo apt -y install chrome-gnome-shell

# neofetch
echo "${ESC}[34m------------neofetch------------${ESC}[m"
sudo apt -y install neofetch

# git
echo "${ESC}[34m------------git------------${ESC}[m"
sudo apt -y install git

# vivaldi / checked at 20220611
echo "${ESC}[34m------------vivaldi------------${ESC}[m"
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list
sudo apt update && sudo apt -y install vivaldi-stable


# VSCode / checled at 20220611
echo "${ESC}[34m------------VSCode------------${ESC}[m"
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y code

# Postman / checled at 20220611
echo "${ESC}[34m------------Postman------------${ESC}[m"
sudo snap install postman

# Syncthing / checled at 20220611
echo "${ESC}[34m------------Syncthing------------${ESC}[m"
sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt update
sudo apt install -y syncthing

# Docker / checled at 20220611 / bullseye
echo "${ESC}[34m------------Docker------------${ESC}[m"
sudo apt update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  bullseye stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin


# dconf-editor
echo "${ESC}[34m------------dconf-editor------------${ESC}[m"
sudo apt -y install dconf-editor

# powershell
echo "${ESC}[34m------------powershell------------${ESC}[m"
sudo apt update && sudo apt install -y curl gnupg apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'
sudo apt update
sudo apt install -y powershell

# oh-my-posh
echo "${ESC}[34m------------oh-my-posh------------${ESC}[m"
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip
mkdir -p ~/.config/powershell/
cp ./forCopy/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

# nerd-fonts
echo "${ESC}[34m------------nerd-fonts------------${ESC}[m"
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/SourceCodePro.zip -O /usr/share/fonts/SourceCodePro.zip
sudo unzip /usr/share/fonts/SourceCodePro.zip -d /usr/share/fonts/truetype/SauceCodePro/
sudo rm /usr/share/fonts/SourceCodePro.zip

# espanso
echo "${ESC}[34m------------espanso------------${ESC}[m"
wget https://github.com/federico-terzi/espanso/releases/download/v2.1.5-beta/espanso-debian-wayland-amd64.deb
sudo apt install -y ./espanso-debian-wayland-amd64.deb
sudo setcap "cap_dac_override+p" $(which espanso)
espanso service register
espanso start
find ~/.config/espanso/match/ -name "*.yaml"|xargs rm
find ~/.config/espanso/match/ -name "*.yml"|xargs rm
cp ./forCopy/base.yml ~/.config/espanso/match/base.yml
find ~/.config/espanso/config/ -name "*.yaml"|xargs rm
find ~/.config/espanso/config/ -name "*.yml"|xargs rm
cp ./forCopy/default.yml ~/.config/espanso/config/default.yml

# duf
echo "${ESC}[34m------------duf------------${ESC}[m"
sudo apt update
sudo apt install -y duf

# dua
echo "${ESC}[34m------------dua------------${ESC}[m"
curl -LSfs https://raw.githubusercontent.com/Byron/dua-cli/master/ci/install.sh | \
    sh -s -- --git Byron/dua-cli --target x86_64-unknown-linux-musl --crate dua --tag v2.17.4
export PATH="$PATH:~/.cargo/bin/"

# wezterm
echo "${ESC}[34m------------wezterm------------${ESC}[m"
wget https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Debian11.deb
sudo apt -y install ./wezterm-nightly.Debian11.deb
cp ./forCopy/.wezterm.lua ~/.wezterm.lua



# pip3
echo "${ESC}[34m------------pip3------------${ESC}[m"
sudo apt install -y python-pip3

# nautilus-open-any-terminal
echo "${ESC}[34m------------nautilus-open-any-terminal------------${ESC}[m"
pip3 install nautilus-open-any-terminal

# add code-nautilus
echo "${ESC}[34m------------code-nautilus------------${ESC}[m"
wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh | bash


# set default terminal
echo "${ESC}[34mSET YOUR TERMINAL AS WESTERM${ESC}[m"
sudo update-alternatives --config x-terminal-emulator

# set git
git config --global user.name "kashiwade"
git config --global user.email "music5d7_1415@outlook.com"

# Settings
echo "${ESC}[34m------------Settings------------${ESC}[m"
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip "['<Shift><Super>s']"
gsettings set org.gnome.settings-daemon.plugins.media-keys home "['<Primary><Alt>f']"

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "wezterm"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>t"

gsettings set org.gnome.shell favorite-apps "['code.desktop', 'vivaldi-stable.desktop', 'org.wezfurlong.wezterm.desktop', 'org.gnome.Settings.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'org.gnome.tweaks.desktop', 'syncthing-ui.desktop']"

gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

gsettings set org.gtk.Settings.FileChooser show-hidden true

xdg-settings set default-web-browser vivaldi-stable.desktop

mkdir ~/.config/autostart/
cp ./forCopy/syncthing-start.desktop ~/.config/autostart/
sudo apt autoremove -y

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

echo "${ESC}[34mConfiguration finished${ESC}[m"
echo "${ESC}[34mPlease reboot.${ESC}[m"