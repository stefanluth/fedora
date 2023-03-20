#!/bin/bash

mkdir $HOME/.local/bin/
ln -sf $HOME/.local/kitty.app/bin/kitty $HOME/.local/kitty.app/bin/kitten $HOME/.local/bin/
cp $HOME/.local/kitty.app/share/applications/kitty.desktop $HOME/.local/share/applications/
cp $HOME/.local/kitty.app/share/applications/kitty-open.desktop $HOME/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" $HOME/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" $HOME/.local/share/applications/kitty*.desktop
curl -s "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Dracula.conf" > $HOME/.config/kitty/theme.conf

source $HOME/.bashrc

# check if DOTFILES_REPO_ROOT is set
if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "DOTFILES_REPO_ROOT is not set. Please set it in your .bashrc."
    exit 1
fi

mkdir -p $HOME/.config/kitty

echo "Copying kitty.conf..."
curl -s "$DOTFILES_REPO_ROOT/dotfiles/kitty/kitty.conf" > $HOME/.config/kitty/kitty.conf

echo "Copying theme.conf..."
curl -s "$DOTFILES_REPO_ROOT/dotfiles/kitty/theme.conf" > $HOME/.config/kitty/theme.conf
