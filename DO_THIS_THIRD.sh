#!/bin/bash

sh ./installprogram/installprogram.sh

gnome-tweaks &

sh ./changesetting/changesetting.sh

sh ./changelogo/changelogo.sh

echo "all finished"