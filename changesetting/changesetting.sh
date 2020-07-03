#!/bin/bash


gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>t"


gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "erea-screen-shot"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-screenshot --area"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Shift><Super>s"

gsettings set org.gnome.shell favorite-apps "['code_code.desktop', 'vivaldi-stable.desktop', 'org.gnome.Terminal.desktop', 'gnome-control-center.desktop', 'org.gnome.Nautilus.desktop', 'gnome-system-monitor.desktop', 'org.gnome.tweaks.desktop', 'syncthing-ui.desktop']"



cp ./changesetting/forcopy/.imwheelrc ~/
cp ./changesetting/forcopy/imwheel.desktop ~/.config/autostart/
cp ./changesetting/forcopy/syncthing.desktop ~/.config/autostart/

pkill gnome-tweaks

echo "configuration finished"