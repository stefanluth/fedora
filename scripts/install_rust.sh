#!/bin/bash

if command -v rustup &> /dev/null
then
    echo "rustup is already installed"
    exit
fi

if command -v cargo &> /dev/null
then
    echo "cargo is already installed"
    exit
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
