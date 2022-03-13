# An alias to open Neovim with vi or vim
alias vi='nvim'
alias vim='nvim'

# An alias to copy the curren working directory to clipboard
alias cpwd='pwd | pbcopy'

# An alias to use bat instead of cat
alias cat='bat'

# Substitute ls with exa
alias ls='exa -lha'                                                          # ls
alias l='exa'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias lS='exa -1'                                                              # one column, just names
alias tree='exa --tree --level=2'                                         # tree

# Uses batman instead of man for manpages syntax highlighting
alias man=batman

# Alias for using python3 instead of python
alias python='python3'
alias pip='pip3'

# Alias for brew bundle dump
alias bbd='brew bundle dump --force --describe'
# Alias for check Path in a better way
alias trail='<<<${(F)path}'
# Alias to substitute rm for a more forgivable tool, trash-cli
alias rm='trash'

# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr

# Functions
# Create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$_"
}
