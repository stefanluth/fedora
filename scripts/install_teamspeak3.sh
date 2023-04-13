#!/bin/bash

DOWNLOAD_PAGE="https://www.teamspeak.com/en/downloads/#client"
CLIENT_DOWNLOAD_URL=$( curl -s $DOWNLOAD_PAGE | grep -oP 'https://files.teamspeak-services.com/releases/client/.*?/TeamSpeak3-Client-linux_amd64-.*?\.run' | head -n 1 )
echo "Downloading TeamSpeak3 from $CLIENT_DOWNLOAD_URL"
mkdir -p $HOME/Applications/TeamSpeak3
curl -s $CLIENT_DOWNLOAD_URL -o $HOME/Downloads/teamspeak3.run
chmod +x $HOME/Downloads/teamspeak3.run
echo "Installing TeamSpeak3 to $HOME/Applications/TeamSpeak3"
$HOME/Downloads/teamspeak3.run --target $HOME/Applications/TeamSpeak3
rm $HOME/Downloads/teamspeak3.run
