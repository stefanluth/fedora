#!/bin/bash

if ! command -v firefox &> /dev/null
then
    echo "firefox could not be found"
    echo "skipping firefox extensions installation"
    exit
fi

echo "Installing Firefox extensions..."
mkdir $HOME/.firefox
cd $HOME/.firefox
wget https://addons.mozilla.org/firefox/downloads/file/4073921/ublock_origin-1.47.2.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4071765/bitwarden_password_manager-2023.2.1.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4047244/reddit_enhancement_suite-5.22.15.xpi
wget https://addons.mozilla.org/firefox/downloads/file/3938344/scroll_anywhere-9.2.xpi
firefox \
    ublock_origin-1.47.2.xpi \
    bitwarden_password_manager-2023.2.1.xpi \
    reddit_enhancement_suite-5.22.15.xpi \
    scroll_anywhere-9.2.xpi
