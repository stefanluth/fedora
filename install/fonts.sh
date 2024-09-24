#!/bin/bash

mkdir -p ~/.local/share/fonts/JetBrainsMono
cd ~/.local/share/fonts/JetBrainsMono
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xf JetBrainsMono.tar.xz
rm JetBrainsMono.tar.xz
sudo chown -R root: /usr/local/share/fonts/JetBrainsMono
sudo chmod 644 /usr/local/share/fonts/JetBrainsMono/*
sudo restorecon -vFr /usr/local/share/fonts/JetBrainsMono
sudo fc-cache -f -v
