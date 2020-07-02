#!/bin/bash


sudo cp ./backuped-logos/debian-logos/logo-text-version.svg /usr/share/desktop-base/debian-logos/
sudo cp ./backuped-logos/debian-logos/logo-text-version-64.png /usr/share/desktop-base/debian-logos/
sudo cp ./backuped-logos/debian-logos/logo-text-version-128.png /usr/share/desktop-base/debian-logos/
sudo cp ./backuped-logos/debian-logos/logo-text-version-256.png /usr/share/desktop-base/debian-logos/

rm -r ./backuped-logos

echo "finished"