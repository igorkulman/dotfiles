# Dotfiles

Basic configuration I use on my macOS machines.

## Installation

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles by creating symbolic links to the home directory.

1.  **Install dependencies** from the `Brewfile`:
    ```bash
    brew bundle install
    ```

2.  **Stow the dotfiles**

    To create the symlinks for all configurations, run the following command from the root of this repository:
    ```bash
    stow -t ~ aria2 brew git gnupg hushlogin keybindings zsh
    ```

## Uninstallation

To remove all the symlinks, run the `stow` command with the `-D` (delete) flag:
```bash
stow -D -t ~ aria2 brew git gnupg hushlogin keybindings zsh
```
