#!/bin/bash


# gnome extension host connector
sudo apt-get update
sudo apt-get -y install chrome-gnome-shell

#imwheel
sudo apt-get update
sudo apt-get -y install imwheel

#neofetch
sudo apt-get -y install neofetch

#git
sudo apt-get update
sudo apt-get -y install git

#texlive
sudo apt-get -y install texlive-full

#vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt -y install vivaldi-stable

#VScode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

#Postman
sudo snap install postman

#syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get -y install syncthing


echo "install finished"