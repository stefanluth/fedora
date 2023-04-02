#!/bin/bash

if [ ! -f $HOME/Applications/TeamSpeak3/ts3client_runscript.sh ]; then
    echo "File $HOME/Applications/TeamSpeak3/ts3client_runscript.sh does not exist."
    echo "Please install TeamSpeak3 first and move it to $HOME/Applications/TeamSpeak3/"
    exit 1
fi

if [ -f $HOME/.local/share/applications/teamspeak3.desktop ]; then
    echo "File $HOME/.local/share/applications/teamspeak3.desktop already exists."
    echo "Exiting..."
    exit 1
fi

echo "Creating $HOME/.local/share/applications/teamspeak3.desktop..."
echo "[Desktop Entry]
Name=TeamSpeak 3
GenericName=TeamSpeak
Exec=$HOME/Applications/TeamSpeak3/ts3client_runscript.sh Terminal=false
X-MultipleArgs=false
Type=Application
Icon=$HOME/Applications/TeamSpeak3/styles/default/logo-128x128.png
StartupWMClass=TeamSpeak 3
StartupNotify=true" > $HOME/.local/share/applications/teamspeak3.desktop
