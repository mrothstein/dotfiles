#!/bin/bash

# Aliases
alias dirs="dirs -v"
alias pd="pushd > /dev/null"
alias pwdp="pwd -P"
alias hg="history | grep"

# Environment variables
export MYVIMRC="~/.vimrc"
if [ -e "/usr/local/bin/mvim" ]
  then
    export EDITOR="/usr/local/bin/mvim"
fi
