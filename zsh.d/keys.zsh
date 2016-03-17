# ZSH should use vi-style line-editing when $EDITOR is set as vi, vim
# (or anything else containing the string vi, such as nvi or elvis).
# in case for any reason it isn't, set it anyway.
bindkey -v

# cut the delay moving from insert to normal mode to .1 seconds
export KEYTIMEOUT=1

# Mode Agnostic Keybindings:
# Search through command history with Up/Down, PgUp/PgDown, or C-p/C-n 
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey "^[[5~" history-beginning-search-backward
bindkey "^[[6~" history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
# Home and End go to the beginning and end of lines respectively
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line

# Normal Mode Keybindings:
# H and L go to beginnings and ends of lines
bindkey -M vicmd "H" beginning-of-line
bindkey -M vicmd "L" end-of-line

# Insert Mode Keybindings:
# Make backspace work like vim, not vi
#bindkey -M viins "^?" backwards-delete-char
#bindkey -M viins "^H" backwards-delete-char
