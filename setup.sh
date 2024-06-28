#!/bin/bash

git clone https://github.com/stefanluth/dotfiles $HOME/dotfiles

bash $HOME/dotfiles/install/packages.sh
zsh
bash $HOME/dotfiles/install/alacritty.sh
bash $HOME/dotfiles/install/vscode.sh
bash $HOME/dotfiles/install/fonts.sh

bash $HOME/dotfiles/install/extensions/firefox.sh
bash $HOME/dotfiles/install/extensions/vscode.sh
bash $HOME/dotfiles/install/extensions/gnome.sh
bash $HOME/dotfiles/install/extensions/zsh.sh

bash $HOME/dotfiles/scripts/git.sh

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/.config/Code/User/

cp -a $HOME/dotfiles/dotfiles/. $HOME
mv $HOME/dotfiles/dotfiles/.mozilla/firefox/user.js $HOME/.mozilla/firefox/*.default-release
