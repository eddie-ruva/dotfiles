# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

#Set custom prompt
setopt PROMPT_SUBST
autoload -U promptinit
promptinit

# Initialize completion
autoload -U compinit
compinit

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="garyblessington"

# Aliases
alias tsp='time rspec'
alias bower='noglob bower'
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# Use vim as the editor
export EDITOR=vim

# Uncomment following line if you want to disable colors in ls
DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH:Users/eddie/.rvm/gems/ruby-1.9.3-p194/bin:/Users/eddie/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/eddie/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/eddie/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/eddie/.rvm/bin
export PATH=~/bin:$PATH



PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
