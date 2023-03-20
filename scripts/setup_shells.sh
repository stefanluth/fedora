#!/bin/bash

if ! command -v zsh &> /dev/null
then
    echo "zsh could not be found"
    exit
fi

chsh -s $(which zsh)
sudo chsh -s $(which zsh)
