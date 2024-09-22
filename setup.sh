#!/bin/bash

git clone https://github.com/stefanluth/dotfiles $HOME/dotfiles

echo "Installing packages..."
bash $HOME/dotfiles/install/packages.sh

echo "Installing alacritty..."
bash $HOME/dotfiles/install/alacritty.sh
echo "Installing docker..."
bash $HOME/dotfiles/install/docker.sh
echo "Installing vscode..."
bash $HOME/dotfiles/install/vscode.sh
echo "Installing fonts..."
bash $HOME/dotfiles/install/fonts.sh

bash $HOME/dotfiles/install/extensions/firefox.sh
bash $HOME/dotfiles/install/extensions/vscode.sh
bash $HOME/dotfiles/install/extensions/gnome.sh
bash $HOME/dotfiles/install/extensions/zsh.sh

gsettings set org.gnome.desktop.input-sources show-all-sources true

bash $HOME/dotfiles/scripts/git.sh

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/.config/Code/User/

cp -a $HOME/dotfiles/dotfiles/. $HOME
cp -a $HOME/dotfiles/dotfiles/.mozilla/firefox/user.js $HOME/.mozilla/firefox/*.default-release

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
