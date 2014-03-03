# Aliases
alias e='emacs'
alias py='python'
alias ll='ls -trla'
alias sub='/Applications/Sublime\ Text\ 2.app/Contents/MacOS/Sublime\ Text\ 2'
alias gitbuzz='cd ~/Documents/projects/siramix/buzzwords; git status'
alias gitphrase='cd ~/Documents/projects/siramix/phrasecraze; git status'
alias redblue='cd ~/Documents/projects/redblue'
alias workspace='cd ~/Documents/workspace'

# History
## Increase History size
HISTSIZE=1000
HISTFILESIZE=2500
# Append hist file (don't overwrite it)
shopt -s histappend

# Environment Variables
export CLICOLOR=1
## Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
## Maven
export M3_HOME=/usr/local/Cellar/maven/3.1.1
## Android
export ANDROID_HOME=/Library/android-sdk-mac_x86
export ANDROID_SDK=${ANDROID_HOME}
export ANDROID_TOOLS=${ANDROID_HOME}/tools

# Path
export PATH=${PATH}:${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_TOOLS}
export PATH=${PATH}:/Library/android-sdk-mac_x86/platform-tools/
export PATH=${PATH}:/usr/local/apache-ant/bin
export PATH=${PATH}:/usr/local/bin/maven
export PATH=${PATH}:${M3_HOME}/bin

# Colors for my prompt!
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
NO_COLOUR="\[\033[0m\]"

# Git Configs
## Set git autocompletion and PS1 integration
if [ -f /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
fi
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

## Now colorize my prompt
PS1="$GREEN\u@machine$BLUE:\w$RED\$(__git_ps1)$NO_COLOUR\$ "
