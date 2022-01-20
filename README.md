# dotfiles
Various dotfiles including my Neovim and Tmux configuration

## Instructions
1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `sudo softwareupdate --install-rosetta` Necessary for some apps that are not apple silicon supported
3. `git clone https://github.com/rubenmate/dotfiles.git ~/.dotfiles`
4. `cd ~/.dotfiles`
5. If necessary, `git checkout <another_branch>`.
6. Do one last Software Audit by editing [Brewfile](Brewfile) directly.
7. [`./install`](install)
8. Restart computer.
## TODO
- Dock Preferences
- Mission Control Preference (don't rearrange spaces)
- Finder Show Path Bar
- Trackpad (Three Finger Drag and Tap to Click) 
- Git (config and [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh)) 
- Flash keyboard layout using QMK Toolbox
- Install digital certificate
- Missing casks:
    - Spotify
- Include language server installs on corresponding scripts
- Configure tmuxinator
- Tmux Plugins:
    - tmux/
    - tmux-fzf-url/
    - tmux-sensible/
    - tmux-vi-navigation/
    - tpm/
    - vim-tmux-navigator/
- Install Things
