#!/bin/bash

# Get sudo
sudo -v

# Add RPM Fusion Repos
echo "Adding RPM Fusion repos..."
sudo dnf install \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    -y

# Add Docker Repo
echo "Adding Docker repo..."
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# Add VS Code Repo
echo "Adding VS Code repo..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Install zsh, VS Code and other stuff
echo "Installing zsh, VS Code and other stuff..."
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf install \
    bzip2 \
    bzip2-devel \
    cargo \
    code \
    containerd.io \
    cronie \
    docker \
    docker-buildx-plugin \
    docker-ce \
    docker-ce-cli \
    docker-compose-plugin \
    dotnet \
    firefox \
    gcc \
    gdbm-devel \
    gh \
    gimp \
    git \
    gnome-extensions-app \
    gnome-shell-extension-blur-my-shell.noarch \
    gnome-shell-extension-just-perfection.noarch \
    gnome-shell-extension-user-theme.noarch \
    gnome-tweaks \
    htop \
    libffi-devel \
    libnsl2-devel \
    libuuid-devel \
    lpf-spotify-client \
    make \
    nodejs \
    openssl-devel \
    pip \
    python \
    readline-devel \
    rust \
    sqlite \
    sqlite-devel \
    telegram-desktop \
    thefuck \
    tk-devel \
    util-linux-user \
    vlc \
    xz-devel \
    zlib-devel \
    zsh \
    --allowerasing \
    --skip-broken \
    -y

# Install pyenv
echo "Installing pyenv..."
curl https://pyenv.run | bash

# Install VS Code extensions
echo "Installing VS Code extensions..."
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

# Add VS Code settings
echo "Adding VS Code settings..."
mkdir ~/.config/Code/User
echo "{
    \"editor.formatOnSave\": true,
    \"editor.inlineSuggest.enabled\": true,
    \"editor.minimap.enabled\": false,
    \"editor.rulers\": [120],
    \"python.formatting.blackArgs\": [\"-l 120\"],
    \"python.formatting.blackPath\": \"~/.local/bin/black\",
    \"python.formatting.provider\": \"black\"
    \"security.workspace.trust.untrustedFiles\": \"open\",
    \"terminal.external.linuxExec\": \"zsh\",
    \"terminal.integrated.defaultProfile.linux\": \"zsh\",
    \"workbench.startupEditor\": \"none\",
}" >> ~/.config/Code/User/settings.json

# Install Firefox extensions
echo "Installing Firefox extensions..."
mkdir ~/.firefox
cd ~/.firefox
wget https://addons.mozilla.org/firefox/downloads/file/4073921/ublock_origin-1.47.2.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4071765/bitwarden_password_manager-2023.2.1.xpi
wget https://addons.mozilla.org/firefox/downloads/file/4047244/reddit_enhancement_suite-5.22.15.xpi
firefox ublock_origin-1.47.2.xpi
firefox bitwarden_password_manager-2023.2.1.xpi
firefox reddit_enhancement_suite-5.22.15.xpi

# Add Firefox settings
echo "Adding Firefox settings..."
sudo rm -f /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js
cd ~/.mozilla/firefox/*.default-release
echo "user_pref(\"trailhead.firstrun.didSeeAboutWelcome\", true);" >> prefs.js

# Disable telemetry
echo "Disabling telemetry..."
echo "user_pref(\"app.shield.optoutstudies.enabled\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.feeds.telemetry\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.telemetry\", false);" >> prefs.js
echo "user_pref(\"browser.ping-centre.telemetry\", false);" >> prefs.js
echo "user_pref(\"datareporting.healthreport.uploadEnabled\", false);" >> prefs.js
# Disable sponsored content
echo "Disabling sponsored content..."
echo "user_pref(\"browser.newtabpage.activity-stream.feeds.section.topstories\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned\", \"amazon\");" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines\", \"\");" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.section.highlights.includePocket\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.showSponsored\", false);" >> prefs.js
echo "user_pref(\"browser.newtabpage.activity-stream.showSponsoredTopSites\", false);" >> prefs.js
echo "user_pref(\"browser.search.hiddenOneOffs\", \"Google,Amazon.de,Bing,DuckDuckGo,Wikipedia (en)\");" >> prefs.js
echo "user_pref(\"browser.topsites.blockedSponsors\", \"[\\\"amazon\\\",\\\"adidas\\\",\\\"nike\\\",\\\"trivago\\\"]\");" >> prefs.js
echo "user_pref(\"extensions.pocket.enabled\", false);" >> prefs.js
echo "user_pref(\"services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsored\", false);" >> prefs.js
echo "user_pref(\"services.sync.prefs.sync.browser.newtabpage.activity-stream.showSponsoredTopSites\", false);" >> prefs.js
# Set homepage and pinned shortcuts
echo "Setting homepage and pinned shortcuts..."
echo "user_pref(\"browser.newtabpage.pinned\", \"[{\\\"url\\\":\\\"https://github.com\\\",\\\"label\\\":\\\"GitHub\\\"},{\\\"url\\\":\\\"https://youtube.com\\\",\\\"label\\\":\\\"YouTube\\\"},{\\\"url\\\":\\\"https://web.whatsapp.com\\\",\\\"label\\\":\\\"WhatsApp\\\"},{\\\"url\\\":\\\"https://reddit.com\\\",\\\"label\\\":\\\"Reddit\\\"},{\\\"url\\\":\\\"https://outlook.live.com/owa/\\\",\\\"label\\\":\\\"Outlook\\\"}]\");" >> prefs.js
echo "user_pref(\"browser.startup.homepage\", \"about:home\");" >> prefs.js
echo "user_pref(\"browser.startup.page\", 1);" >> prefs.js
echo "user_pref(\"browser.toolbars.bookmarks.visibility\", \"never\");" >> prefs.js
# Disable autofill
echo "Disabling autofill..."
echo "user_pref(\"extensions.formautofill.creditCards.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.autofillForms\", false);" >> prefs.js
echo "user_pref(\"signon.generation.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.management.page.breach-alerts.enabled\", false);" >> prefs.js
echo "user_pref(\"signon.rememberSignons\", false);" >> prefs.js
# Move cache to RAM
echo "Moving cache to RAM..."
echo "user_pref(\"browser.cache.disk.enable\", false);" >> prefs.js
echo "user_pref(\"browser.cache.disk.parent_directory\", \"/run/user/$(id -u)/firefox\");" >> prefs.js
echo "user_pref(\"browser.cache.memory.enable\", true);" >> prefs.js
echo "user_pref(\"browser.sessionstore.interval\", 60000);" >> prefs.js
# Enable DRM content
echo "Enabling DRM content..."
echo "user_pref(\"media.gmp-widevinecdm.abi\", \"x86_64-gcc3\");" >> prefs.js

# Install oh-my-zsh
echo "Installing oh-my-zsh..."
RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Edit .zshrc
echo "Editing .zshrc..."
echo "alias \\\$=''" >> ~/.zshrc
echo "eval \$(thefuck --alias)" >> ~/.zshrc
sed -i "s|ZSH_THEME=\"robbyrussell\"|ZSH_THEME=\"agnoster\"|g" ~/.zshrc
sed -i "s|plugins=(git)|plugins=(dnf git gh zsh-autosuggestions zsh-syntax-highlighting)|g" ~/.zshrc
sed -i "s|# alias zshconfig=\"mate ~/.zshrc\"|alias zshconfig=\"code ~/.zshrc\"|g" ~/.zshrc

# Misc
echo "Doing misc stuff..."
/usr/bin/pip install black
mkdir ~/code
sudo usermod -a -G pkg-build $USER
sudo usermod -aG docker $USER

# Enable all keyboard layouts and move appmenu to the left
echo "Enabling all keyboard layouts and moving appmenu to the left..."
gsettings set org.gnome.desktop.input-sources show-all-sources true
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'

# Switch to Dark Mode
echo "Switching to Dark Mode..."
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Install and setup kitty terminal
echo "Installing and setting up kitty terminal..."
mkdir ~/.config/kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
echo "shell zsh" >> ~/.config/kitty/kitty.conf
echo "editor code" >> ~/.config/kitty/kitty.conf
echo "tab_bar_edge top" >> ~/.config/kitty/kitty.conf
echo "tab_bar_style powerline" >> ~/.config/kitty/kitty.conf
echo "linux_display_server x11" >> ~/.config/kitty/kitty.conf
echo "include theme.conf" >> ~/.config/kitty/kitty.conf
mkdir /home/stefan/.local/bin/
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
curl -s "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Dracula.conf" > ~/.config/kitty/theme.conf

# Setup git/gh
echo "Setting up git/gh..."
read -p "Enter your GitHub user.email: " email 
read -p "Enter your GitHub user.name: " name 
git config --global user.email "$email"
git config --global user.name "$name"
git config --global core.editor "code --wait"
gh auth login

# Change shells
echo "Changing shells..."
chsh -s $(which zsh)
sudo chsh -s $(which zsh)

# Update crontab
echo "Updating crontab..."
echo "@reboot systemctl start docker" | crontab -
