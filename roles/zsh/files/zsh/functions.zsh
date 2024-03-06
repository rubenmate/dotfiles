#!/bin/sh
# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}

# FZF for alternative neovim configurations
function nvims() {
  items=("default" "LazyVim" "kickstart" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config -> " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
