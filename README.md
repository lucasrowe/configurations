# Lucas Rowe — Machine Configuration

Dotfiles and setup automation for macOS. Designed to be executed by an AI assistant or run as a single script.

## Quick Start

**Tell an AI assistant:** "Set up my computer using the instructions in this repo" — then point it at [`SETUP.md`](SETUP.md).

**Or run the script directly:**

```bash
git clone https://github.com/lucasrowe/configurations.git ~/projects/configurations
cd ~/projects/configurations
chmod +x setup.sh
./setup.sh
```

## What's Included

| File | Purpose |
|---|---|
| `SETUP.md` | Step-by-step setup instructions (AI-optimized) |
| `setup.sh` | Automated setup script (runs all steps) |
| `Brewfile` | All Homebrew packages and cask apps |
| `.zshrc` | Zsh config (Oh My Zsh, aliases, nvm, pyenv) |
| `.gitconfig` | Git aliases, delta diff, LFS (no email stored) |
| `karabiner.json` | Keyboard customization (Hyper key, Emacs bindings) |
| `macos-defaults.sh` | macOS system preferences (Finder, Dock, keyboard) |

## Design Principles

- **No secrets in the repo.** Git email is set at setup time, not stored in files.
- **Idempotent.** Safe to re-run `setup.sh` on an already-configured machine.
- **Portable.** Uses `$HOME` instead of hardcoded paths. Works on any Mac username.
- **AI-readable.** `SETUP.md` is structured so Claude or any LLM can follow it step by step.
- **IDE-agnostic.** IDE choice is deferred to setup time — install VS Code, Cursor, Zed, or skip entirely.
