#!/bin/bash
fcitx-config-gtk3

/usr/lib/mozc/mozc_tool --mode=config_dialog

gnome-tweaks &

sh ./installprogram/installprogram.sh

sh ./changesetting/changesetting.sh

sh ./changelogo/changelogo.sh

echo "all finished"