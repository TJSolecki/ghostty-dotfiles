file_to_open="$(git ls-files | fzf --height 70% --tmux 70% --preview 'cat {}')"
if [ -n "$file_to_open" ]; then
    print -S "nvim $file_to_open"
    nvim $file_to_open
fi
