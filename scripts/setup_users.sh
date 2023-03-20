#!/bin/bash

sudo usermod -a -G pkg-build $USER
sudo usermod -aG docker $USER