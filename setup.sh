#!/bin/bash

git clone https://github.com/stefanluth/dotfiles $HOME/dotfiles

echo "---------------------------------------------------"
echo "Installing packages..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/packages.sh
echo "---------------------------------------------------"
echo "Installing flatpaks..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/flatpaks.sh
echo "---------------------------------------------------"
echo "Installing alacritty..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/alacritty.sh
echo "---------------------------------------------------"
echo "Installing docker..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/docker.sh
echo "---------------------------------------------------"
echo "Installing vscode..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/vscode.sh
echo "---------------------------------------------------"
echo "Installing fonts..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/fonts.sh

echo "---------------------------------------------------"
echo "Installing Firefox extensions..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/extensions/firefox.sh
echo "---------------------------------------------------"
echo "Installing VSCode extensions..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/extensions/vscode.sh
echo "---------------------------------------------------"
echo "Installing Gnome extensions..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/extensions/gnome.sh
echo "---------------------------------------------------"
echo "Installing zsh extensions..."
echo "---------------------------------------------------"
bash $HOME/dotfiles/install/extensions/zsh.sh

bash $HOME/dotfiles/scripts/gnome.sh
bash $HOME/dotfiles/scripts/git.sh

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

mkdir -p $HOME/.config/Code/User/

cp -a $HOME/dotfiles/dotfiles/. $HOME
cp -a $HOME/dotfiles/dotfiles/.mozilla/firefox/user.js $HOME/.mozilla/firefox/*.default-release

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
