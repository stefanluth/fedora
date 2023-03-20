#!/bin/bash

source $HOME/.bashrc

# check if DOTFILES_REPO_ROOT is set
if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "DOTFILES_REPO_ROOT is not set. Please set it in your .bashrc."
    exit 1
fi

echo "Copying .zshrc..."
curl -s $DOTFILES_REPO_ROOT/dotfiles/zsh/.zshrc > $HOME/.zshrc
