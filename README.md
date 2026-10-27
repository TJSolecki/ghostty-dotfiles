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

### Install git-delta

Delta is a syntax-highlighting pager for git diffs.

For MacOS run:
```sh
brew install git-delta
```

For Arch Linux run:
```sh
sudo pacman -S git-delta
```

#### Install the Rosé Pine syntax theme

Delta reads custom syntax themes from bat's theme cache, so install bat and add the
[official Rosé Pine TextMate theme](https://github.com/rose-pine/tm-theme):

```sh
mkdir -p "$(bat --config-dir)/themes"
curl -fsSL https://raw.githubusercontent.com/rose-pine/tm-theme/main/dist/rose-pine.tmTheme \
  -o "$(bat --config-dir)/themes/rose-pine.tmTheme"
bat cache --build
```

The gitconfig uses `syntax-theme = rose-pine`. Swap the file name for
`rose-pine-moon.tmTheme` or `rose-pine-dawn.tmTheme` for the other variants, and re-run
`bat cache --build` after upgrading bat.

#### Install Gleam syntax highlighting

Delta uses bat's syntax cache, so add a Gleam syntax definition and rebuild the cache:

```sh
mkdir -p "$(bat --config-dir)/syntaxes"
curl -fsSL https://raw.githubusercontent.com/digitalcora/sublime-text-gleam/main/package/Gleam.sublime-syntax \
  -o "$(bat --config-dir)/syntaxes/Gleam.sublime-syntax"
bat cache --build
```

Verify that both bat and delta can see it:

```sh
bat --list-languages | grep Gleam
delta --list-languages | grep Gleam
```

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

