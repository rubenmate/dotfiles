#!/bin/sh
# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}
