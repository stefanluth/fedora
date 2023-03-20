#!/bin/bash

echo "Enabling all keyboard layouts and moving appmenu to the left..."
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

echo "Switching to Dark Mode..."
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
