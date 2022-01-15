#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup >>>\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Packages to install:
brew install httpie
# brew install htop
# brew install ncdu
brew install bat
brew install fzf
brew install neovim
brew install ripgrep
brew install tmux
brew install tmuxinator
brew install fd
brew install rust
brew install --no-quarantine melonamin/formulae/trex
brew install --no-quarantine --cask kitty
brew install --no-quarantine --cask alfred
brew install --no-quarantine --cask alt-tab
brew install --no-quarantine --cask browserosaurus
brew install --no-quarantine --cask aldente
brew install --no-quarantine --cask hiddenbar
brew install --no-quarantine --cask firefox
brew install --no-quarantine --cask telegram
brew install --no-quarantine --cask enpass

