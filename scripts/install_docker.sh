#!/bin/bash

if command -v docker &> /dev/null
then
    echo "Docker is already installed"
    exit
fi

echo "Adding Docker repo..."
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

PACKAGES=(
    containerd.io
    docker
    docker-buildx-plugin
    docker-ce
    docker-ce-cli
    docker-compose-plugin
)

echo "Installing Docker..."
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y
