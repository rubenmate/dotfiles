#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions ara managed with fnm: https://github.com/Schniz/fnm

if exists node; then
  echo "Node $(node --version) & NPM $(npm --version) already installed"
else
  echo "Installing Node & NPM"
  # Install node lts version with Fast Node Manager
  fnm install --lts
  # Activate yarn
  corepack enable
fi

# Install global NPM packages
echo "Installing global NPM packages"
npm install -g \
  neovim \
  trash-cli \
  json-server \
  typescript \
  http-server \
  eslint \
  # prettier \

echo "Global NPM packages installed"
npm list --global --depth=0
