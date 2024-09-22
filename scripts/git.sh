#!/bin/bash

if ! command -v git &>/dev/null; then
    echo "git could not be found"
    echo "skipping git setup"
    exit
fi

if ! command -v gh &>/dev/null; then
    echo "gh could not be found"
    echo "skipping GitHub CLI setup"
    exit
fi

echo "Setting up git..."
read -p "Enter your GitHub user.email: " email
read -p "Enter your GitHub user.name: " name
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "code --wait"
git config --global pull.rebase true
git config --global fetch.prune true

read -p "Create a new SSH key? (y/N) " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Creating a new SSH key..."
    ssh-keygen -t ed25519 -C "$email"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519

    cat ~/.ssh/id_ed25519.pub
    echo "Copy your SSH key and add it to your GitHub account."

    echo "Go to https://github.com/settings/keys and click 'New SSH key'."
    read -p "Press enter to continue or Ctrl+C to exit"
fi

read -p "Create a new GPG key? (y/N) " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Creating a new GPG key..."
    gpg --full-generate-key
    LONG_KEY_ID=$(gpg --list-secret-keys --keyid-format LONG | grep sec | cut -d' ' -f 4 | cut -d'/' -f 2)
    gpg --armor --export $LONG_KEY_ID
    echo "Copy your GPG key, beginning with -----BEGIN PGP PUBLIC KEY BLOCK----- and ending with -----END PGP PUBLIC KEY BLOCK----- and add it to your GitHub account."

    echo "Go to https://github.com/settings/keys and click 'New GPG key'."
    read -p "Press enter to continue or Ctrl+C to exit"
    git config --global user.signingkey $LONG_KEY_ID
    git config --global commit.gpgsign true
fi

read -p "Set up GitHub CLI? (y/N) " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Setting up GitHub CLI..."
    gh auth login
    gh config set editor "code --wait"
    gh config set git_protocol ssh
fi
