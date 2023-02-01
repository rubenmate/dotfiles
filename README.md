This whole readme is a work in progress
## Instructions to install

1. Install Xcode cli tools `xcode-select --install`
2. Clone the repository `git clone https://github.com/rubenmate/dotfiles.git .dotfiles`
3. Run the dotfiles script `cd .dotfiles` && `./bin/dotfiles` You may need to try to run as sudo once and after failing run as normal again
4. Let the script finish (you may want to add the ssh key to github -it will be showed-)
5. After the first run you can just run `dotfiles` since the binary will be symlinked properly

* Note 1: Login to appstore before running this or mas installation apps will fail
* Note 2: I strongly suggest to check this before running and tune it to your liking. This is something that works for me but may not work for you.


## Things that will be installed/generated
[Work in progress]
- Homebrew (on Linux too)
- SSH key
- Ansible (and this playbook requirements)
- Packages and tools that I find useful
- MacOS apps that I find useful
- Install and link the dotfiles for the following tools:
    - git 
    - zsh
    - starship
    - kitty
    - tmux
    - yabai + skhd
    - neovim (building from source)

## Manual process
[Work in progress]
There are certain things that I didn't find a way to automate (mostly macos GUI apps and macos settings)
- Set raycast instead of spotlight
- Start the installed apps
- Modify dock
- Modify toolbar
- Create spaces for yabai
- Change kitty icon
- Change finder settings and ajust iCloud
