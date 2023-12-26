#!/bin/sh

# Zsh aliases
alias szsh="source ${ZDOTDIR:-$HOME}/.zshrc"

# Git aliases
alias g='git'
alias gss='git status -s'

# Neovim aliases
alias vi='nvim'
alias vim='nvim'
alias nvim-lz="NVIM_APPNAME=LazyVim nvim"
alias nvim-ks="NVIM_APPNAME=kickstart nvim"
alias nv="nvims"

# Eza aliases
alias ls="exa -la --icons"
alias la="exa -la --icons"

# Alias for brew bundle dump
alias bbd='brew bundle dump --force --describe'
# Aliases for update and upgrade with brew
alias upd='brew update && brew outdated'
alias upg='brew upgrade'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
