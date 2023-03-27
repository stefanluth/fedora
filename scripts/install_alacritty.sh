PACKAGES=(
    cmake
    freetype-devel
    fontconfig-devel
    libxcb-devel
    libxkbcommon-devel
    g++
)

echo "Installing Alacritty dependencies..."
sudo dnf install ${PACKAGES[@]} --allowerasing --skip-broken -y

echo "Installing Alacritty..."
git clone https://github.com/alacritty/alacritty/ $HOME/code/alacritty
cd $HOME/code/alacritty
cargo build --release --features=wayland
sudo cp target/release/alacritty /usr/local/bin
