#!/bin/bash

if ! command -v tmux &> /dev/null
then
    echo "tmux could not be found"
    echo "skipping tmux setup"
    exit
fi

source $HOME/.bashrc

if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "DOTFILES_REPO_ROOT is not set. Please set it in your .bashrc."
    exit 1
fi

echo "Copying tmux.conf..."
curl -s "$DOTFILES_REPO_ROOT/dotfiles/tmux/tmux.conf" > $HOME/.tmux.conf
