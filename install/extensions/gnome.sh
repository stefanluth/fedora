#!/bin/bash

PACKAGES=(
    gnome-extensions-app
    gnome-shell-extension-blur-my-shell.noarch
    gnome-shell-extension-just-perfection.noarch
    gnome-shell-extension-user-theme.noarch
    gnome-tweaks
)

echo "Installing GNOME extensions..."
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y
