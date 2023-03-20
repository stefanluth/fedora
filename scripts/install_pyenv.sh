#!/bin/bash

echo "Installing Python build dependencies..."
sudo dnf install \
    bzip2 \
    bzip2-devel \
    gcc \
    gdbm-devel \
    libffi-devel \
    libnsl2-devel \
    libuuid-devel \
    make \
    openssl-devel \
    readline-devel \
    sqlite \
    sqlite-devel \
    tk-devel \
    xz-devel \
    zlib-devel \
    -y

echo "Installing pyenv..."
curl https://pyenv.run | bash