#!/bin/bash


# gnome extension host connector
sudo apt-get update
sudo apt-get install chrome-gnome-shell

#imwheel
sudo apt-get update
sudo apt-get install imwheel

#neofetch
sudo apt-get install neofetch

#git
sudo apt-get update
sudo apt-get install git

#texlive
sudo apt-get install texlive

#vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update && sudo apt install vivaldi-stable

#snap
sudo apt update
sudo apt install snapd

#VScode
sudo snap install --classic code

#Postman
sudo snap install Postman

#syncthing
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing


echo "install finished"