#!/bin/bash

# Aliases
alias dirs="dirs -v"
alias pd="pushd > /dev/null"
alias pwdp="pwd -P"
alias hg="history | grep"

# Environment variables
export MYVIMRC="~/.vimrc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

###-tns-completion-start-###
if [ -f /Users/max/.tnsrc ]; then
    source /Users/max/.tnsrc
fi
###-tns-completion-end-###
