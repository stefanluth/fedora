#!/bin/bash

PACKAGES=(
    cargo
    code
    cronie
    dotnet
    firefox
    gcc
    gh
    gimp
    git
    htop
    lpf-spotify-client
    make
    nodejs
    openssl-devel
    pip
    python
    readline-devel
    rust
    sqlite
    sqlite-devel
    telegram-desktop
    thefuck
    util-linux-user
    vlc
    zsh
)

# Get sudo
sudo -v

echo "Adding RPM Fusion repos..."
sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    -y

echo "Installing packages..."
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y
