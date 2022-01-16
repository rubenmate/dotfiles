#!/usr/bin/env zsh

echo 'Installing Neovim plugins'
nvim +PlugInstall +PlugUpdate +qall
