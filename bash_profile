#!/bin/bash

if [ -e "$HOME/.bashrc" ]
  then
    source $HOME/.bashrc
fi

# Ignore whitespace and duplicates. Erase duplicates.
export HISTCONTROL=ignorespace:ignoredups:erasedups

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
#export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend

chrome () {
    open -a "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "$1"
}

# Load ssh keys
{ eval `ssh-agent`; ssh-add -A; } &> /dev/null

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export ANDROID_HOME=$HOME/Library/Android/sdk
export JAVA_HOME=/Library/Java/Home
