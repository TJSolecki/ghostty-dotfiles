# Dotfiles

## Setup
### Install the ghostty terminal emulator

See the install guide [here](https://ghostty.org/docs/install/binary)

For MacOS run:
```sh
brew install --cask ghostty
```

### Install oh-my-posh

See the install guide [here](https://ohmyposh.dev/docs/installation/macos)

For MacOS run:
```sh
brew install jandedobbeleer/oh-my-posh/oh-my-posh
```

### Install tmux

For MacOS run:
```sh
brew install tmux
```

To install plugins, run tmux and type `ctl+b I`

### Install neovim

For MacOS run:
```sh
brew install neovim
```

Also install the ripgrep, since it is a depedency for the telescope. Ripgrep is a faster grep written in Rust that by
default respects your .gitignore.
```sh
brew install ripgrep
```

### Install fzf

Fzf is a fuzzy-finder for the cli.

For MacOS Run:
```sh
brew install fzf
```

## Install zoxide

A smarter cd replacement.

For MacOS run:
```sh
shcurl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

## Install sesh

A better way to manage tmux sessions.

For MacOS run:
```sh
brew install sesh
```

