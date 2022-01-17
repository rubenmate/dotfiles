#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions ara managed with fnm: https://github.com/Schniz/fnm

if exists node; then
  echo "Node $(node --version) & NPM $(npm --version) already installed"
else
  echo "Installing Node & NPM"
  fnm install --lts
fi

# Install global NPM packages
echo "Installing global NPM packages"
npm install -g \
  trash-cli \
  json-server \
  typescript \
  http-server \
  eslint \

echo "Global NPM packages installed"
npm list --global --depth=0
