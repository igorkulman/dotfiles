echo "Setting up Xcode Command Line tools"
xcode-select --install
sudo xcodebuild -license accept

echo "Installing Homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" brew doctor

echo "Installing Homebrew tools"
brew install aria2 bat git git-lfs midnight-commander swiftlint wget curl hugo rbenv
brew install --cask the-unarchiver db-browser-for-sqlite fork iina keepassxc provisionql quicklook-json standard-notes visual-studio-code iterm2 flux signal firefox imageoptim stats maccy hiddenbar
brew tap homebrew/cask-fonts
brew install font-droid-sans-mono-for-powerline

echo "Setting up zsh"
mkdir -p "$HOME/.zsh"
git clone git@github.com:marlonrichert/zsh-snap.git "$HOME/.zsh/zsh-snap"
ln -s "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"

echo "Setting up git"
ln -s "$HOME/.dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ln -s "$HOME/.dotfiles/gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

echo "Silencing last login info"
touch "$HOME/.hushlogin"

echo "Applying various macOS settings"
# Expand save panel by default
# https://www.defaults-write.com/expand-save-panel-default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true
# Show Xcode build time
defaults write com.apple.dt.Xcode ShowBuildOperationDuration -bool YES
# Show Xcode indexing files count
defaults write com.apple.dt.Xcode IDEIndexerActivityShowNumericProgress -bool true
# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
# Disable screenshot thumbnails
defaults write com.apple.screencapture show-thumbnail -bool FALSE