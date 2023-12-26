#!/bin/sh
HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
# export TERMINAL="kitty"
#export TERM=xterm-256color # needed for wezterm
export TERM=wezterm # TODO: Do this conditional based on wezterm installed or not
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.local/share/go/bin:$PATH
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

# fnm
if command -v fnm &> /dev/null; then
  eval "$(fnm env --use-on-cd --version-file-strategy recursive)"
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

# Brew
if command -v brew &> /dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Atuin
if command -v atuin &> /dev/null; then
    eval "$(atuin init zsh)"
fi

# Required for cargo
if command -v cargo &> /dev/null; then
  . "$HOME/.cargo/env"
fi
