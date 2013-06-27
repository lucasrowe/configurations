# Aliases
alias e='emacs'
alias py='python'
alias ll='ls -trla'
alias sub='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'
alias gitbuzz='cd ~/Documents/projects/buzzwords; git status'
alias gitphrase='cd ~/Documents/projects/phrasecraze; git status'
alias workspace='cd ~/Documents/workspace'

# Increase History size
HISTFILESIZE=2500

# Environment Variables
export CLICOLOR=1
export PATH=${PATH}:/Library/android-sdk-mac_x86/
#export PATH=${PATH}:/Library/android-sdk-mac_x86/platform-tools/
#export PATH=${PATH}:/Library/android-sdk-mac_x86/tools/

# Colors for my prompt!
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
NO_COLOUR="\[\033[0m\]"

# Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Now colorize my prompt
PS1="$GREEN\u@machine$BLUE:\w$RED\$(__git_ps1)$NO_COLOUR\$ "
