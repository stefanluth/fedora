#!/bin/bash

if ! command -v gsettings &> /dev/null
then
    echo "gsettings could not be found"
    echo "skipping GNOME setup"
    exit
fi

if ! command -v gnome-extensions &> /dev/null
then
    echo "gnome-extensions could not be found"
    echo "skipping GNOME setup"
    exit
fi

echo "Enabling all keyboard layouts and moving appmenu to the left..."
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

echo "Switching to Dark Mode..."
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.background picture-uri-dark file:///usr/share/backgrounds/gnome/blobs-d.svg

echo "Setting up GNOME Shell extensions..."
gnome-extensions disable apps-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions disable background-logo@fedorahosted.org


if ! gnome-extensions list | grep -q "user-theme"; then
    echo "user-theme extension not installed, you might need to logout and login again"
    exit 1
fi

if ! gnome-extensions list | grep -q "blur-my-shell"; then
    echo "blur-my-shell extension not installed, you might need to logout and login again"
    exit 1
fi

if ! gnome-extensions list | grep -q "just-perfection-desktop"; then
    echo "just-perfection-desktop extension not installed, you might need to logout and login again"
    exit 1
fi

echo "Enabling extensions..."
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gnome-extensions enable blur-my-shell@aunetx
gnome-extensions enable just-perfection-desktop@just-perfection

echo "Setting keymap..."
localectl set-keymap --no-convert us-euro
