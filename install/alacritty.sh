#!/bin/bash

cd $HOME/Downloads
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
# Fix title bar, see https://github.com/alacritty/alacritty/issues/4739#issuecomment-1661396063
sudo sed -i 's/^Exec=alacritty/Exec=env WINIT_UNIX_BACKEND=x11 alacritty/g' extra/linux/Alacritty.desktop
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
