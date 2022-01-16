# An alias to open Neovim with vi or vim
alias vi='nvim'
alias vim='nvim'

# An alias to copy the curren working directory to clipboard
alias cpwd='pwd | pbcopy'

# Substitute ls with exa
alias ls='exa -laFh --git'                                                          # ls
alias l='exa'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree

# Uses batman instead of man for manpages syntax highlighting
alias man=batman

# Alias for brew bundle dump
alias bbd='brew bundle dump --force --describe'

# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

# Functions
# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}
