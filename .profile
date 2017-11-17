# Aliases
alias e='emacs'
alias py='python'
alias ll='ls -trla'
alias sub='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
#alias gitbuzz='cd ~/Documents/projects/siramix/buzzwords; git status'
#alias gitphrase='cd ~/Documents/projects/siramix/phrasecraze; git status'
alias redblue='cd ~/Projects/redbluegames'
alias personal='cd ~/Projects/personal'

# History
## Increase History size
HISTSIZE=1000
HISTFILESIZE=2500
# Append hist file (don't overwrite it)
# shopt -s histappend

# Environment Variables
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export SVN_EDITOR=vim
## Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home
## Maven
export M3_HOME=/usr/local/Cellar/maven/3.1.1
## Android
export ANDROID_HOME=/Library/android-sdk-macosx
export ANDROID_SDK=${ANDROID_HOME}
export ANDROID_TOOLS=${ANDROID_HOME}/tools

# Path
export PATH=${PATH}:${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_TOOLS}
export PATH=${PATH}:/Library/android-sdk-macosx/platform-tools
#export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin
#export PATH=${PATH}:/usr/local/apache-ant/bin
#export PATH=${PATH}:/usr/local/bin/maven
#export PATH=${PATH}:${M3_HOME}/bin

# Colors for my prompt!
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[1;36m\]"
NO_COLOUR="\[\033[0m\]"

# Git Configs
## Set git autocompletion and PS1 integration
# brew install git bash-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi
GIT_PS1_SHOWDIRTYSTATE=true
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

## Now colorize my prompt
PS1="$GREEN\u@machine$CYAN:\w$RED\$(__git_ps1)$NO_COLOUR\$ "
