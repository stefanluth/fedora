#!/bin/bash

cd $HOME
git clone https://github.com/stefanluth/dotfiles
cd dotfiles

bash install/packages.sh
bash install/alacritty.sh
bash install/vscode.sh
bash install/fonts.sh

bash install/extensions/firefox.sh
bash install/extensions/vscode.sh
bash install/extensions/gnome.sh
bash install/extensions/zsh.sh

bash scripts/git.sh

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/.config/Code/User/

cp -r dotfiles/* $HOME/
mv $HOME/.mozilla/firefox/user.js $HOME/.mozilla/firefox/*.default-release
