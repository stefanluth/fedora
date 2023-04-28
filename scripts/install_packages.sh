#!/bin/bash

PACKAGES=(
    code
    cronie
    dotnet
    ffmpeg
    firefox
    fzf
    gcc
    gh
    gimp
    git
    htop
    kernel-devel
    lame
    lame-libs
    lpf-spotify-client
    make
    nodejs
    nvim
    openssl-devel
    openvpn
    pip
    python
    readline-devel
    sqlite
    sqlite-devel
    telegram-desktop
    thefuck
    tmux
    transmission
    transmission-cli
    transmission-gtk
    util-linux-user
    vlc
    wireshark
    xclip
    zsh
)

echo "Adding RPM Fusion repos..."
sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    -y

echo "Installing packages..."
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y

echo "Adding user to pkg-build group..."
sudo usermod -a -G pkg-build $USER
