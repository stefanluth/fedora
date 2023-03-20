#!/bin/bash

if ! [ -x "$(command -v zsh)" ]; then
    echo "zsh is not installed. Skipping..."
    exit 0
fi

if ! [ -d $HOME/.oh-my-zsh ]; then
    echo "oh-my-zsh is not installed"
    exit 0
fi

echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
