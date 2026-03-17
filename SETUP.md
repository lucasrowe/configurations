# Machine Setup

> **This file is designed to be read and executed by an AI assistant.**
> When asked to "set up my computer," follow these instructions sequentially.
> Each section is a discrete step. Run commands unless marked `[MANUAL]`.

## Prerequisites

- macOS (Apple Silicon assumed)
- Logged into the Mac App Store
- This repo cloned to `~/projects/lucasrowe/configurations`

## 0. Gather Credentials (One-Time Prompts)

Before running anything, ask the user for:

1. **Git email address** — will be set via `git config --global user.email`
2. **Git signing preference** — SSH key signing, GPG, or none
3. **Which IDE(s) to install** — e.g., VS Code, Cursor, Zed, WebStorm, or none (user is evaluating)
4. **Optional apps** — Linear (project management)

Store answers in environment variables for the duration of setup:

```bash
export GIT_USER_EMAIL="<provided by user>"
export INSTALL_IDE="<comma-separated list or 'none'>"
```

---

## 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After install, ensure brew is on PATH:

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

---

## 2. Install All Packages and Apps via Brewfile

```bash
brew bundle --file=~/projects/lucasrowe/configurations/Brewfile
```

This installs CLI tools, fonts, and GUI apps. See `Brewfile` for the full manifest.

**IDE installation:** Based on the user's IDE preference from Step 0, also run:

```bash
# Examples — only install what the user chose:
brew install --cask visual-studio-code
brew install --cask cursor
brew install --cask zed
```

**Optional apps:** Based on the user's preferences from Step 0, also run:

```bash
# Only install if the user chose it:
brew install --cask linear-linear
```

---

## 3. Configure Git

```bash
git config --global user.name "Lucas Rowe"
git config --global user.email "$GIT_USER_EMAIL"
```

Then symlink the rest of the git config (aliases, LFS, etc.):

```bash
# Backup existing config values we just set
GIT_NAME=$(git config --global user.name)
GIT_EMAIL=$(git config --global user.email)

# Link the gitconfig from this repo
ln -sf ~/projects/lucasrowe/configurations/.gitconfig ~/.gitconfig

# Re-apply identity (since the symlinked file doesn't include them)
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
```

---

## 4. Set Up Shell (Zsh)

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
```

### Install Zsh plugins

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Symlink .zshrc

```bash
ln -sf ~/projects/lucasrowe/configurations/.zshrc ~/.zshrc
source ~/.zshrc
```

---

## 5. Set Up Node.js via nvm

```bash
# nvm is installed via Brewfile
mkdir -p ~/.nvm
# .zshrc already exports NVM_DIR and loads nvm
source ~/.zshrc
nvm install --lts
nvm use --lts
```

---

## 6. Install Python (via pyenv)

```bash
# pyenv is installed via Brewfile
# .zshrc already initializes pyenv
source ~/.zshrc
pyenv install 3.12
pyenv global 3.12
```

---

## 7. Set Up Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Verify:

```bash
claude --version
```

---

## 8. Configure Karabiner Elements

```bash
mkdir -p ~/.config/karabiner
ln -sf ~/projects/lucasrowe/configurations/karabiner.json ~/.config/karabiner/karabiner.json
```

This sets up:
- **Caps Lock → Control** (simple modification)
- **Right Option → Hyper Key** (Cmd+Ctrl+Opt+Shift) for app-level shortcuts
- **Emacs-style cursor movement**: Ctrl+P/N for up/down, Opt+F/B for word navigation
- **Emacs-style selection**: Ctrl+Shift+P/N, Opt+Shift+F/B
- **Opt+D** for forward-delete word

---

## 9. Apply macOS System Preferences

```bash
chmod +x ~/projects/lucasrowe/configurations/macos-defaults.sh
~/projects/lucasrowe/configurations/macos-defaults.sh
```

This configures Finder, Dock, keyboard, trackpad, and other system settings.
A restart is recommended after running this.

---

## 10. `[MANUAL]` Steps Requiring Human Action

These steps cannot be automated and require the user to do them manually:

1. **Sign into apps**: 1Password, Slack, Figma, Arc/Chrome, Notion
2. **Set up SSH keys**: Generate or restore from 1Password, add to GitHub
3. **Configure Rectangle/Raycast**: Import settings or set up shortcuts
4. **Restore IDE settings**: Sign into Settings Sync (VS Code) or equivalent
5. **Set default browser**: System Settings → Desktop & Dock → Default web browser

---

## Verification Checklist

After setup, verify these work:

```bash
brew --version          # Homebrew installed
git --version           # Git available
node --version          # Node.js via nvm
python3 --version       # Python via pyenv
claude --version        # Claude Code CLI
gh auth status          # GitHub CLI authenticated
```

Run `git config user.email` to confirm your email is set and not committed to the repo.
