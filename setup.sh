#!/bin/bash
# =============================================================================
# Machine Setup Script — Lucas Rowe
# Run: chmod +x setup.sh && ./setup.sh
#
# This script is idempotent — safe to run multiple times.
# For AI assistants: you can also execute each section individually
# by following SETUP.md step-by-step.
# =============================================================================

set -e  # Exit on error

CONFIGS_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "📂 Configurations directory: $CONFIGS_DIR"

# ---------------------------------------------------------------------------
# Step 0: Gather user input
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 0: Configuration ==="

if [ -z "$(git config --global user.email)" ]; then
  read -p "Git email address: " GIT_EMAIL
  git config --global user.email "$GIT_EMAIL"
fi

if [ -z "$(git config --global user.name)" ]; then
  git config --global user.name "Lucas Rowe"
fi

echo "Git identity: $(git config --global user.name) <$(git config --global user.email)>"

# ---------------------------------------------------------------------------
# Step 1: Homebrew
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 1: Homebrew ==="

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew already installed. Updating..."
  brew update
fi

# ---------------------------------------------------------------------------
# Step 2: Brewfile
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 2: Installing packages and apps ==="

brew bundle --file="$CONFIGS_DIR/Brewfile"

# IDE — ask user
echo ""
echo "Which IDE(s) would you like to install?"
echo "  1) VS Code"
echo "  2) Cursor"
echo "  3) Zed"
echo "  4) None / I'll install later"
read -p "Enter numbers separated by spaces (e.g., '1 2'): " IDE_CHOICES

for choice in $IDE_CHOICES; do
  case $choice in
    1) brew install --cask visual-studio-code 2>/dev/null || true ;;
    2) brew install --cask cursor 2>/dev/null || true ;;
    3) brew install --cask zed 2>/dev/null || true ;;
    4) echo "Skipping IDE installation." ;;
  esac
done

# ---------------------------------------------------------------------------
# Step 3: Git config
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 3: Git configuration ==="

# Save identity before symlinking
GIT_NAME="$(git config --global user.name)"
GIT_EMAIL="$(git config --global user.email)"

# Symlink gitconfig (aliases, LFS, editor, etc.)
ln -sf "$CONFIGS_DIR/.gitconfig" ~/.gitconfig

# Re-apply identity on top of symlinked file
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "Git configured: $GIT_NAME <$GIT_EMAIL>"

# ---------------------------------------------------------------------------
# Step 4: Shell (Zsh + Oh My Zsh)
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 4: Shell setup ==="

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Symlink .zshrc
ln -sf "$CONFIGS_DIR/.zshrc" ~/.zshrc
echo "Shell configured."

# ---------------------------------------------------------------------------
# Step 5: Node.js (via nvm)
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 5: Node.js ==="

export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

if command -v nvm &>/dev/null; then
  nvm install --lts
  nvm use --lts
  echo "Node.js $(node --version) installed."
else
  echo "⚠️  nvm not available yet. Restart terminal and run: nvm install --lts"
fi

# ---------------------------------------------------------------------------
# Step 6: Python (via pyenv)
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 6: Python ==="

if command -v pyenv &>/dev/null; then
  PYTHON_VERSION="3.12"
  if ! pyenv versions | grep -q "$PYTHON_VERSION"; then
    pyenv install "$PYTHON_VERSION"
  fi
  pyenv global "$PYTHON_VERSION"
  echo "Python $(python3 --version) configured."
else
  echo "⚠️  pyenv not available yet. Restart terminal and run: pyenv install 3.12 && pyenv global 3.12"
fi

# ---------------------------------------------------------------------------
# Step 7: Claude Code
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 7: Claude Code ==="

if ! command -v claude &>/dev/null; then
  npm install -g @anthropic-ai/claude-code
  echo "Claude Code installed: $(claude --version)"
else
  echo "Claude Code already installed: $(claude --version)"
fi

# ---------------------------------------------------------------------------
# Step 8: Karabiner Elements
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 8: Karabiner Elements ==="

mkdir -p ~/.config/karabiner
ln -sf "$CONFIGS_DIR/karabiner.json" ~/.config/karabiner/karabiner.json
echo "Karabiner configured."

# ---------------------------------------------------------------------------
# Step 9: macOS Defaults
# ---------------------------------------------------------------------------
echo ""
echo "=== Step 9: macOS system preferences ==="

if [ -f "$CONFIGS_DIR/macos-defaults.sh" ]; then
  chmod +x "$CONFIGS_DIR/macos-defaults.sh"
  "$CONFIGS_DIR/macos-defaults.sh"
fi

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
echo "============================================"
echo "✅ Setup complete!"
echo "============================================"
echo ""
echo "Manual steps remaining:"
echo "  1. Sign into apps: 1Password, Slack, Figma, Arc"
echo "  2. Set up SSH keys if not already done: gh auth login (select SSH)"
echo "  3. Set terminal font: iTerm2 → Settings → Profiles → Text → Font → FiraCode Nerd Font"
echo "  4. Set default browser: System Settings → Desktop & Dock"
echo "  5. Restart your terminal to load all changes"
echo ""
echo "Verify with:"
echo "  brew --version && git --version && node --version && python3 --version && claude --version"
