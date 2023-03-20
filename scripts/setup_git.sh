#!/bin/bash

if ! command -v git &> /dev/null
then
    echo "git could not be found"
    exit
fi

if ! command -v gh &> /dev/null
then
    echo "gh could not be found"
    exit
fi

echo "Setting up git..."
read -p "Enter your GitHub user.email: " email
read -p "Enter your GitHub user.name: " name
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "code --wait"

echo "Setting up gh..."
gh auth login
