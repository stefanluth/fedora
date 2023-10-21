#!/bin/bash

CONFIG_DIR=$HOME/.config

mkdir -p $CONFIG_DIR
cd $CONFIG_DIR
git clone https://github.com/stefanluth/dotfiles
cd dotfiles/.config

cp -r alacritty $CONFIG_DIR
cp Code/User/settings.json $CONFIG_DIR/Code/User/settings.json
cp .zshrc $HOME/.zshrc
cp .tmux.conf $HOME/.tmux.conf
cp .mozilla/user.js $HOME/.mozilla/firefox/*.default-release
