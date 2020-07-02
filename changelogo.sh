#!/bin/bash

mkdir backuped-logos
cp -r /usr/share/desktop-base/debian-logos/ ./backuped-logos

sudo cp ./fixed-logos/logo-text-version.svg /usr/share/desktop-base/debian-logos/
sudo cp ./fixed-logos/logo-text-version-64.png /usr/share/desktop-base/debian-logos/
sudo cp ./fixed-logos/logo-text-version-128.png /usr/share/desktop-base/debian-logos/
sudo cp ./fixed-logos/logo-text-version-256.png /usr/share/desktop-base/debian-logos/

echo "finished"