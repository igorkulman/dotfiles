# Dotfiles

Basic configuration I use on my macOS machines.

The actual dotfiles are stored in folder according to their usage, so `git` folder contains `.gitconfig`, `zsh` folder contains `.zshrc`. etc.

### Setup script

The setup script automates the initial machine setup by

- setting up Xcode command line tools
- installing homebrew
- installing basic software from homebrew and homebrew cask
- linking all the configuration files
- setting up zsh
- setting various macOS quality of life settings

## Automated setup

Clone the repository to `$HOME/.dotfiles`

```bash
git clone git@github.com:igorkulman/dotfiles.git "$HOME/.dotfiles"
```

and run the setup script

```bash
cd "$HOME/.dotfiles"
sh setup.sh
```