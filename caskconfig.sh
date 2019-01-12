#!/bin/sh

echo "[🚀] Starting setup"

xcode-select --install

# Install Homebrew if not already installed
if test ! $(which brew); then
    echo "[🍺] Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "[🍺] Updating homebrew..."
brew update
brew doctor
brew cleanup -s

PACKAGES=(
    binutils
    colordiff
    coreutils
    diffutils
    git
    gpg
    go
    gzip
    htop
    imagemagick
    nmap
    node
    npm
    python
    ruby
    tree
    tmux
    unzip
    watch
    wget
    zsh
)
echo "[🍺] Installing brew packages..."
brew install ${PACKAGES[@]}

echo "Installing vim"
brew install vim --override-system-vi

echo "Installing gnu products"
brew install findutils --default-names
brew install gnu-sed --default-names
brew install gnu-tar --default-names
brew install gnu-which --default-names
brew install gnutls --default-names
brew install grep --default-names

echo "Installing Oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
source ~/.zshrc

CASKS=(
    docker
    fantastical
    firefox
    goland
    google-chrome
    handbrake
    slack
    spotify
    virtualbox
    visual-studio
    vlc
    zeplin
)
echo "[🍺] Installing cask apps..."
brew cask install ${CASKS[@]}

echo "[🧼] Cleaning up..."
brew cleanup -s

echo "[🎉] Setup complete!"