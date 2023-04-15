#!/bin/bash

if ! command -v docker &> /dev/null
then
    echo "docker could not be found"
    echo "skipping docker setup"
    exit
fi

echo "Updating crontab to start docker on boot..."
echo "@reboot systemctl start docker" | crontab -

echo "Adding $USER to docker group..."
sudo usermod -aG docker $USER
