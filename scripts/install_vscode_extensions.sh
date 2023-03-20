#!/bin/bash

if ! command -v code &> /dev/null
then
    echo "code could not be found"
    exit
fi

code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.copilot
code --install-extension ms-dotnettools.csharp
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension oderwat.indent-rainbow
code --install-extension redhat.vscode-yaml
code --install-extension ritwickdey.LiveServer
code --install-extension rust-lang.rust-analyzer
