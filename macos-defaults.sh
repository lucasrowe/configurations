#!/bin/bash
# =============================================================================
# macOS System Preferences — Lucas Rowe
# Apply sensible defaults for a fresh Mac.
# Run: chmod +x macos-defaults.sh && ./macos-defaults.sh
#
# Restart is recommended after running.
# =============================================================================

echo "Applying macOS defaults..."

# Close System Preferences to prevent overriding changes
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null

# ---------------------------------------------------------------------------
# Finder
# ---------------------------------------------------------------------------
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Hide .app extensions while keeping other file extensions visible
defaults write NSGlobalDomain AppleShowAllExtensions -bool false

# Show path bar at the bottom of Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Default to list view in Finder
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ---------------------------------------------------------------------------
# Dock
# ---------------------------------------------------------------------------
# Set Dock icon size
defaults write com.apple.dock tilesize -int 48

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Remove auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up auto-hide animation
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into their application icon
defaults write com.apple.dock minimize-to-application -bool true

# ---------------------------------------------------------------------------
# Keyboard
# ---------------------------------------------------------------------------
# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Short delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable auto-capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable period substitution (double-space → period)
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ---------------------------------------------------------------------------
# Trackpad
# ---------------------------------------------------------------------------
# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three-finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# ---------------------------------------------------------------------------
# Screenshots
# ---------------------------------------------------------------------------
# Save screenshots to ~/Screenshots
mkdir -p "$HOME/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Screenshots"

# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# ---------------------------------------------------------------------------
# Misc
# ---------------------------------------------------------------------------
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# ---------------------------------------------------------------------------
# Apply changes
# ---------------------------------------------------------------------------
echo "Restarting affected apps..."
killall Finder 2>/dev/null
killall Dock 2>/dev/null
killall SystemUIServer 2>/dev/null

echo "✅ macOS defaults applied. Some changes may require a restart."
