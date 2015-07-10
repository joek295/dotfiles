# .zshrc is the equivalent of .bashrc & .kshrc

DOTFILES=$HOME/media/dotfiles
ZSH_PLUGINS=$DOTFILES/zsh.d

ALIASES=$DOTFILES/sh.d/aliases
FUNCTIONS=$DOTFILES/sh.d/functions

ZALIASES=$ZSH_PLUGINS/aliases.zsh
PROMPT=$ZSH_PLUGINS/prompt.zsh
HISTORY=$ZSH_PLUGINS/history.zsh
COMPLETION=$ZSH_PLUGINS/completions.zsh

if [ -f $ALIASES ]; then
  source $ALIASES
fi

if [ -f $ZALIASES ]; then
    source $ZALIASES
fi

if [ -f $FUNCTIONS ]; then
  source $FUNCTIONS
fi

source $HISTORY

setopt NO_BEEP
setopt MULTIOS
setopt AUTO_CD

# automatic completion options:
setopt GLOB_COMPLETE    
setopt GLOB_SUBST
setopt EXTENDEDGLOB

# ZSH should use vi-style line-editing when $EDITOR is set as vi, vim
# (or anything else containing the string vi, such as nvi or elvis).
# in case for any reason it isn't, set it anyway.
bindkey -v
# up and down should move through command history
[[ -n "${key[Up]}"   ]]  && bindkey  "${key[Up]}"    history-beginning-search-backward
[[ -n "${key[Down]}" ]]  && bindkey  "${key[Down]}"  history-beginning-search-forward
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

autoload -U colors && colors

source $PROMPT

# zsh syntax highlighting
# available at https://github.com/zsh-users/zsh-syntax-highlighting
if [ -e $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source $COMPLETION
