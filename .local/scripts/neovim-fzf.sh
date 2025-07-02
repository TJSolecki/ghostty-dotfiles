#!/bin/zsh

file_to_open="$(git ls-files | fzf --height 70% --tmux 70% --preview 'cat {}')"
if [ -n "$file_to_open" ]; then
  command="nvim $file_to_open"
  # Adds the command to the zsh history
  print -s "$command"
  eval "$command"
fi
