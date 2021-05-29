#!/bin/bash

DOTFILES_ROOT=$(pwd -P)

## Based on the bootstrap script from https://github.com/holman/dotfiles
info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

setup_gitconfig () {
  if ! [ -f git/gitconfig.local.symlink ]
  then
    info 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink

    success 'gitconfig'
  fi
}

link_file () {
  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then
    mv "$dst" "${dst}.backup"
    success "moved $dst to ${dst}.backup"
  fi

  ln -sf "$1" "$2"
  success "linked $1 to $2"
}

install_dotfiles () {
  info 'installing dotfiles'

  for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
  do
    dst="$HOME/.$(basename "${src%.*}")"
    link_file "$src" "$dst"
  done

  # Symlink vimrc and vim plugins
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -sf ~/.vim $XDG_CONFIG_HOME/nvim
  ln -sf ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
}

setup_gitconfig
install_dotfiles

info "installing dependencies"
if source installers/setup.sh | while read -r data; do info "$data"; done
then
  success "dependencies installed"
else
  fail "error installing dependencies"
fi

exit 0
