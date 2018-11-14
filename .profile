# Aliases
alias e='emacs'
alias py='python'
alias ll='ls -trla'
alias sub='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
#alias gitbuzz='cd ~/Documents/projects/siramix/buzzwords; git status'
#alias gitphrase='cd ~/Documents/projects/siramix/phrasecraze; git status'
alias redblue='cd ~/Projects/redbluegames'
alias personal='cd ~/Projects/personal'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/MacOS/Electron'

# History
## Increase History size
HISTSIZE=1000
HISTFILESIZE=2500
# Append hist file (don't overwrite it)
# shopt -s histappend

# Environment Variables
# Ruby (if installed)
if which ruby >/dev/null && which gem >/dev/null; then
    export GEM_PATH=~/.gem
    export GEM_HOME=~/.gem
    export PATH=${PATH}:${GEM_PATH}/bin
fi

export PATH=${PATH}:/Users/lucasrowe/Library/Python/2.7/bin

# Subversion
export SVN_EDITOR=vim
## Java
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home
## Maven
#export M3_HOME=/usr/local/Cellar/maven/3.1.1
## Android
#export ANDROID_HOME=/Library/android-sdk-macosx
#export ANDROID_SDK=${ANDROID_HOME}
#export ANDROID_TOOLS=${ANDROID_HOME}/tools
#export ANDROID_SDK_ROOT="/usr/local/lib/android-sdk"

# Path
#export PATH=${PATH}:${ANDROID_SDK}
#export PATH=${PATH}:${ANDROID_TOOLS}
#export PATH=${PATH}:/Library/android-sdk-macosx/platform-tools
#export PATH=${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin
#export PATH=${PATH}:/usr/local/apache-ant/bin
#export PATH=${PATH}:/usr/local/bin/maven
#export PATH=${PATH}:${M3_HOME}/bin

# Git Configs (Commented out since iTerm2 and ZSH has git colorized already
## Set git autocompletion and PS1 integration
# brew install git bash-completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#    . `brew --prefix`/etc/bash_completion
#fi
#GIT_PS1_SHOWDIRTYSTATE=true
#if [ -f /opt/local/etc/bash_completion ]; then
#    . /opt/local/etc/bash_completion
#fi

## Now colorize my prompt
#PS1="$GREEN\u@machine$CYAN:\w$RED\$(__git_ps1)$NO_COLOUR\$ "
