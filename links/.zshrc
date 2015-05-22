# .zshrc is the equivalent of .bashrc & .kshrc

ALIASES=$HOME/.aliases
ZALIASES=$HOME/.zsh_aliases
FUNCTIONS=$HOME/.functions

if [ -f $ALIASES ]; then
  source $ALIASES
fi

if [ -f $ZALIASES ]; then
    source $ZALIASES
fi

if [ -f $FUNCTIONS ]; then
  source $FUNCTIONS
fi

#history options
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=1000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY # incremental append history
setopt HIST_IGNORE_DUPS

setopt NO_BEEP
setopt MULTIOS
setopt AUTO_CD

# Completion: this is significantly more fancy than bash's completion
# system!
autoload -U compinit
compinit

# automatic completion options:
setopt AUTO_LIST        # tabbing on an ambiguously incomplete command lists possibilities
setopt MENU_COMPLETE    # tabbing on an ambiguously incomplete command selects first possibility
setopt COMPLETE_IN_WORD # tabbing in the middle of a word will try to complete that word
setopt GLOB_COMPLETE    
setopt COMPLETE_ALIASES
setopt AUTO_PARAM_SLASH 

# ZSH should use vi-style line-editing when $EDITOR is set as vi, vim
# (or anything else containing the string vi, such as nvi or elvis).
# Here we make sure that this behaviour is as expected.
bindkey -v
# up and down should move through command history
[[ -n "${key[Up]}"   ]]  && bindkey  "${key[Up]}"    history-beginning-search-backward
[[ -n "${key[Down]}" ]]  && bindkey  "${key[Down]}"  history-beginning-search-forward

autoload -U colors && colors
PS1="%{$fg[blue]%}%n%{$fg[default]%}@%m:%{$fg[green]%}%~
%{%(#~$fg[red]~$fg[default])%}%#%{$fg[default]%} "

# colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;42;30m' 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

