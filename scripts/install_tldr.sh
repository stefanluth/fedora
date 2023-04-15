#!/bin/bash

if ! command -v pip3 &> /dev/null
then
    echo "pip3 could not be found"
    echo "skipping tldr installation"
    exit
fi

if command -v tldr &> /dev/null
then
    echo "tldr is already installed"
    exit
fi

sudo -H pip3 install tldr
