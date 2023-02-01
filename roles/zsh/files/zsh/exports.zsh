#!/bin/sh
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
# export BROWSER="brave"
# export PATH="$HOME/.local/bin":$PATH
# export MANPAGER='nvim +Man!'
# export MANWIDTH=999
# export PATH=$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.local/share/go/bin:$PATH
# export GOPATH=$HOME/.local/share/go
# export PATH=$HOME/.fnm:$PATH
# export PATH="$HOME/.local/share/neovim/bin":$PATH
# export XDG_CURRENT_DESKTOP="Wayland"
# export PATH="$PATH:./node_modules/.bin"

# Remove the Homekeeper for Homebrew installs
export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
# Export path to dotfiles brewfile so we can dump it everywhere
export HOMEBREW_BUNDLE_FILE="$DOTFILES/config/Brewfile"

# Homebrew to path
case "$(uname -s)" in
Linux)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
;;
Darwin)
eval "$(/opt/homebrew/bin/brew shellenv)"
;;
esac
# fnm
if command -v fnm &> /dev/null; then
  eval "$(fnm env)"
fi
#Zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi
# Starship prompt
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
# GPG signing
export GPG_TTY=$(tty)
# Navi
if command -v navi &> /dev/null; then
  eval "$(navi widget zsh)"
fi
