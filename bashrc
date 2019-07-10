#!/bin/bash

# Aliases
alias dirs="dirs -v"
alias pd="pushd > /dev/null"
alias pwdp="pwd -P"
alias hg="history | grep"
alias gcn="git commit --no-verify"
alias vim="nvim"

# Environment variables
export MYVIMRC="~/.vimrc"

###-tns-completion-start-###
if [ -f /Users/max/.tnsrc ]; then
    source /Users/max/.tnsrc
fi
###-tns-completion-end-###

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

firefox() {
  open -a "/Applications/Firefox.app" "$1"
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
# Show git branch with colors in bash prompt
# https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \w \[\033[32m\]\$(parse_git_branch)\[\033[00m\] \n  \$ "

[ -s "/Users/max.rothstein/.scm_breeze/scm_breeze.sh" ] && source "/Users/max.rothstein/.scm_breeze/scm_breeze.sh"

# Add dotnet to path
export PATH=$HOME/bin:/usr/local/bin:$PATH:/usr/local/share/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
