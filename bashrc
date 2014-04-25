# Based on Gary Bernhardt
# https://github.com/garybernhardt/dotfiles/blob/master/.bashrc
. ~/bin/bash_colors.sh

export PATH=${PATH}:/usr/local/bin
export PATH="~/bin:$PATH"

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
