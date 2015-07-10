# -*- sh -*-

# ~/.zsh_history contains zsh's history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=5000

# Append history to the history file as it is written
setopt INC_APPEND_HISTORY 

# Do not enter duplicates of the previous command to the history file
setopt HIST_IGNORE_DUPS
# Do not show commands more than once when searching backwards through history
setopt HIST_FIND_NO_DUPS
# When history expires, duplicates are removed before unique commands
setopt HIST_EXPIRE_DUPS_FIRST
