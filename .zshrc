# Aliases
alias lsa="ls -al --color"
alias ls="ls --color"

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
zinit light zsh-users/zsh-history-substring-search
zinit light MichaelAquilina/zsh-auto-notify
zinit light Aloxaf/fzf-tab

# Load completions
autoload -Uz compinit && compinit

# Keybindings
## Use emacs keybindings
bindkey -e
## bind up arrow key to search backwards in your history matching the currently provided text
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Zsh history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
## Don't save duplicate commands in ~/.zsh_history
HISTDUPE=erase
## Don't overwirte history, append instead
setopt appendhistory
## Share history accross parrallel zsh sessions
setopt sharehistory
## If you want something to not be saved (such as secrets), prepending the command with a space will prevent it from
## being saved
setopt histignorespace
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# auto-notify config
export AUTO_NOTIFY_WHITELIST=("gw test" "gw pkg" "pnpm exec" "pnpx" "pnpm run build" "pnpm run lint" "pnpm run check")
export AUTO_NOTIFY_EXPIRE_TIME=5000

# zsh-history-substring-search config
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=0
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=0

eval "$(fzf --zsh)"
