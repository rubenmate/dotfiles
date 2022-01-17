#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions ara managed with fnm: https://github.com/Schniz/fnm

if exists node; then
  echo "Node $(node --version) & NPM $(npm --version) already installed"
else
  echo "Installing Node & NPM"
  fnm install --lts
fi

