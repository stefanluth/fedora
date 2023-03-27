#!/bin/bash

echo "Updating crontab to start docker on boot..."
echo "@reboot systemctl start docker" | crontab -

echo "Adding $USER to docker group..."
sudo usermod -aG docker $USER
