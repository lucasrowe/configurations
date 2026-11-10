# =============================================================================
# Lucas Rowe — .zshrc
# Portable Zsh config for macOS (Apple Silicon)
# =============================================================================

# ---------------------------------------------------------------------------
# Oh My Zsh
# ---------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # Using Starship instead (initialized at end of file)

plugins=(
  git
  brew
  npm
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# ---------------------------------------------------------------------------
# Homebrew
# ---------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ---------------------------------------------------------------------------
# nvm (Node.js)
# ---------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ---------------------------------------------------------------------------
# pyenv (Python)
# ---------------------------------------------------------------------------
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# ---------------------------------------------------------------------------
# z (directory jumping)
# ---------------------------------------------------------------------------
if [ -f "$(brew --prefix)/etc/profile.d/z.sh" ]; then
  . "$(brew --prefix)/etc/profile.d/z.sh"
fi

# ---------------------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------------------
alias ll='eza -la --git --icons'      # Modern ls with git status
alias la='eza -la --git --icons'
alias lt='eza --tree --level=2'       # Tree view
alias cat='bat --paging=never'        # Syntax-highlighted cat
alias g='git'
alias gs='git status -s'
alias gd='git diff'
alias gc='git commit --verbose'
alias gco='git checkout'
alias gp='git pull --rebase --prune'
# Project shortcuts
alias onyx='cd ~/projects/onyx'
alias configs='cd ~/projects/lucasrowe/configurations'

# ---------------------------------------------------------------------------
# Functions
# ---------------------------------------------------------------------------
# Quit Chrome and every helper process it leaves behind.
# Asks politely first so Chrome saves its session and writes its settings,
# then force-kills whatever ignored the request.
killchrome() {
  if ! pgrep -x "Google Chrome" >/dev/null; then
    echo "Chrome is not running"
    return 0
  fi

  osascript -e 'tell application "Google Chrome" to quit' 2>/dev/null

  # Give it up to 5s to exit cleanly
  local waited=0
  while pgrep -x "Google Chrome" >/dev/null && [ $waited -lt 10 ]; do
    sleep 0.5
    waited=$((waited + 1))
  done

  # Match process NAMES, not full command lines: -f would also match the
  # shell running this function. Leave chrome_crashpad_handler alone, since
  # other Chromium browsers run one too; it exits with its parent.
  if pgrep "Google Chrome" >/dev/null; then
    pkill "Google Chrome"
    sleep 1
    pgrep "Google Chrome" >/dev/null && pkill -9 "Google Chrome"
  fi

  if pgrep "Google Chrome" >/dev/null; then
    echo "⚠️  Some Chrome processes are still running"
    return 1
  fi
  echo "✅ Chrome closed"
}

# ---------------------------------------------------------------------------
# Editor
# ---------------------------------------------------------------------------
export EDITOR="code -w"  # Update if you change IDEs

# ---------------------------------------------------------------------------
# PATH additions
# ---------------------------------------------------------------------------
# Claude Code (installed globally via npm)
# gh CLI (installed via Homebrew, already on PATH)

# ---------------------------------------------------------------------------
# History
# ---------------------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicates
setopt HIST_FIND_NO_DUPS     # Don't show duplicates in search
setopt SHARE_HISTORY         # Share history between sessions

# ---------------------------------------------------------------------------
# Misc
# ---------------------------------------------------------------------------
# Enable fzf key bindings and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable "correct" prompts (annoying for most workflows)
unsetopt correct_all

# ---------------------------------------------------------------------------
# Starship prompt (must be last)
# ---------------------------------------------------------------------------
eval "$(starship init zsh)"
