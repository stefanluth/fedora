#!/bin/bash

source $HOME/.bashrc

# check if DOTFILES_REPO_ROOT is set
if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "DOTFILES_REPO_ROOT is not set. Please set it in your .bashrc."
    exit 1
fi

/usr/bin/pip install black

mkdir -p $HOME/.config/Code/User
echo "Copying settings.json..."
curl -s "$DOTFILES_REPO_ROOT/dotfiles/vscode/settings.json" > $HOME/.config/Code/User/settings.json
