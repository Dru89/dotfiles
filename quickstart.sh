command -v hub > /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
command -v stow > /dev/null || brew install stow
stow --target $HOME alacritty
stow --target $HOME bash
stow --target $HOME curl
stow --target $HOME git
stow --target $HOME homebrew
stow --target $HOME hyper
stow --target $HOME neovim
stow --target $HOME shell
stow --target $HOME starship
stow --target $HOME tmux
# stow --target $HOME zsh # using bash instead for now

(cd && brew bundle)
