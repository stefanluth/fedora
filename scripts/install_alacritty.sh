#!/bin/bash

if ! command -v cargo &> /dev/null
then
    echo "cargo could not be found"
    echo "skipping alacritty installation"
    exit
fi

if command -v alacritty &> /dev/null
then
    echo "alacritty is already installed"
    exit
fi

PACKAGES=(
    cmake
    freetype-devel
    fontconfig-devel
    libxcb-devel
    libxkbcommon-devel
    g++
)

echo "Installing Alacritty dependencies..."
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y

echo "Installing Alacritty..."
git clone https://github.com/alacritty/alacritty/ $HOME/code/alacritty
cd $HOME/code/alacritty
cargo build --release --features=wayland
sudo cp target/release/alacritty /usr/local/bin
