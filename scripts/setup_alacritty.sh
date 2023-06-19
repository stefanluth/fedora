#!/bin/bash

source $HOME/.bashrc

if ! command -v alacritty &> /dev/null; then
    echo "Alacritty could not be found"
    echo "Skipping Alacritty setup"
    exit 1
fi

cd $HOME/code/alacritty

echo "Setting up Alacritty..."
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg

echo "Installing Alacritty desktop file..."
sed -i 's/^Exec=alacritty/Exec=env -u WAYLAND_DISPLAY alacritty/g' extra/linux/Alacritty.desktop
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

echo "Installing Alacritty completions..."
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty

# check if DOTFILES_REPO_ROOT is set
if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "DOTFILES_REPO_ROOT is not set. Please set it in your .bashrc."
    exit 1
fi

echo "Copying .alacritty.toml..."
curl -s $DOTFILES_REPO_ROOT/dotfiles/alacritty/.alacritty.toml > $HOME/.alacritty.toml
