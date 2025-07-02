# Aliases
alias lsa="ls -al --color"
alias ls="ls --color"
alias nf="source ~/.local/scripts/neovim-fzf.sh"

# oh-my-posh prompt
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"

# Initialize znit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Keybindings
# Use emacs keybindings
bindkey -e
# bind up arrow key to search backwards in your history matching the currently provided text
bindkey "^[[A" history-search-backward
# same but forwards for down arrow
bindkey "^[[B" history-search-forward
# same for ctl+p
bindkey "^p" history-search-backward
# same but forwards for ctl+n
bindkey "^n" history-search-forward

# Zsh history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# Don't save duplicate commands in ~/.zsh_history
HISTDUPE=erase
# Don't overwirte history, append instead
setopt appendhistory
# Share history accross parrallel zsh sessions
setopt sharehistory
# If you want something to not be saved (such as secrets), prepending the command with a space will prevent it from
# being saved
setopt histignorespace
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling

# Case insenstive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(fzf --zsh)"
