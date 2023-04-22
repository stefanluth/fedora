#!/bin/bash

echo "Setting up Fedora..."

if [[ "$1" == "-y" ]]; then
    echo "Running in non-interactive mode..."
    export NON_INTERACTIVE=true
fi

if [ -z "$DOTFILES_REPO_ROOT" ]; then
    echo "Setting DOTFILES_REPO_ROOT in .bashrc..."
    echo 'export DOTFILES_REPO_ROOT="https://raw.githubusercontent.com/stefanluth/fedora_setup/main"' >> $HOME/.bashrc
fi

source $HOME/.bashrc
mkdir -p $HOME/code

SCRIPTS=(
    setup_dnf.sh
    install_packages.sh
    install_vscode.sh
    install_docker.sh
    install_rust.sh
    install_pyenv.sh
    install_tldr.sh
    install_ohmyzsh.sh
    install_alacritty.sh
    install_firefox_extensions.sh
    install_vscode_extensions.sh
    install_gnome_extensions.sh
    install_zsh_plugins.sh
    install_teamspeak.sh
    install_discord.sh
    setup_firefox.sh
    setup_vscode.sh
    setup_docker.sh
    setup_gnome.sh
    setup_teamspeak.sh
    setup_zsh.sh
    setup_git.sh
    setup_firmware.sh
    setup_shells.sh
)

if [[ "$NON_INTERACTIVE" == "true" ]]; then
    for script in ${SCRIPTS[@]}; do
        echo "bash <(curl -sSf $DOTFILES_REPO_ROOT/scripts/$script)"
        bash <(curl -sSf $DOTFILES_REPO_ROOT/scripts/$script)
    done
    exit 0
fi

for script in ${SCRIPTS[@]}; do
    echo "bash <(curl -sSf $DOTFILES_REPO_ROOT/scripts/$script)"
    read -p "^ Run command? (y/N) " -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        bash <(curl -sSf $DOTFILES_REPO_ROOT/scripts/$script)
    fi
done
