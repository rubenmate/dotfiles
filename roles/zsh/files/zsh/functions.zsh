#!/bin/sh
# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}
# Llama terminal file explorer
function zz {
  cd "$(llama "$@")"
}

