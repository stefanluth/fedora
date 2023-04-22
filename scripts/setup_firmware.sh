#!/bin/bash

echo "Updating firmware..."
sudo fwupdmgr refresh --force
sudo fwupdmgr get-updates
sudo fwupdmgr update
