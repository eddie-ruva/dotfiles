set -e

install_homebrew () {
  echo " Installing Homebrew for you."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to your PATH in /Users/egalindo-ascend/.zprofile:
  echo "Adding Homebrew to your PATH"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew analytics off
}

install_vim_plug () {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_brew_packages () {
  # Neovim
  brew install --HEAD luajit
  brew install --HEAD neovim

  # Ack
  brew install ack
}

install_nvm () {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
}

install_homebrew
install_brew_packages
install_vim_plug
install_nvm
