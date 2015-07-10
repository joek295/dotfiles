# .zshrc is the equivalent of .bashrc & .kshrc

DOTFILES=$HOME/media/dotfiles
ZSH_PLUGINS=$DOTFILES/zsh.d

ALIASES=$DOTFILES/sh.d/aliases
FUNCTIONS=$DOTFILES/sh.d/functions

ZALIASES=$ZSH_PLUGINS/aliases.zsh
PROMPT=$ZSH_PLUGINS/prompt.zsh
HISTORY=$ZSH_PLUGINS/history.zsh

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

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
zstyle ':completion:*:expand:*' tag-order all-expansions
# zsh better completion of kill command:
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# automatic completion options:
setopt AUTO_LIST        # tabbing on an ambiguously incomplete command lists possibilities
setopt MENU_COMPLETE    # tabbing on an ambiguously incomplete command selects first possibility
setopt COMPLETE_IN_WORD # tabbing in the middle of a word will try to complete that word
setopt GLOB_COMPLETE    
setopt GLOB_SUBST
setopt EXTENDEDGLOB
setopt COMPLETE_ALIASES
setopt AUTO_PARAM_SLASH 

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

# Completion: this is significantly more fancy than bash's completion
# system!
# NB: keep at the bottom of the file; things break otherwise!
autoload -U compinit && compinit
