# dotfiles

NOTE: This requires the neovim nightly with [global status line](https://github.com/neovim/neovim/commit/3c7e937a892308498ba23ce5c0959e51fbf28911)

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
- Disable C-space on keyboard settings
- Git (config and [SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh))
- Optional: Add GPG key
- Change dotfiles git repo with the ssh connection after configuring SSH
- Condfigure enpass, dropbox and alfred
- Install [JetBrains Mono Font](https://www.jetbrains.com/lp/mono/)
- Install some NF also, like Cascadia Code
- `brew install --cask font-jetbrains-mono` && `brew install --cask font-jetbrains-mono-nerd-font`
- Install XCode, install yabai and start yabai and skhd as services
- Install pip and neovim support
- Change Kitty icon
- Flash keyboard layout using QMK Toolbox
- Install digital certificate
- Include language server installs on corresponding scripts
- Configure tmuxinator, tmux resurrect
- Fix icons, cloning them makes them a mess
- I can probably remove the submodules and install them with an script
- Apps outside brew and the mac app store:
  - Itsycal
  - AppCleaner
  - Downie
  - Permute
  - Tweetbot
  - iStat Menus
  - Microsoft Teams
- Add correct installation of Rust (with Rustup)
- Possible problem with zshenv cargo folder not existing on initial setup
- Add telescope find files to search in my dotfiles
- IMPORTANT: Fix Tmux folder and symlinks for tmux-cht.sh
