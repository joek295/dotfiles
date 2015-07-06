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
# Here we make sure that this behaviour is as expected.
bindkey -v
# up and down should move through command history
[[ -n "${key[Up]}"   ]]  && bindkey  "${key[Up]}"    history-beginning-search-backward
[[ -n "${key[Down]}" ]]  && bindkey  "${key[Down]}"  history-beginning-search-forward

autoload -U colors && colors

source $ZPROMPT

zle -N zle-line-init
zle -N zle-keymap-select

# colourful man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;42;30m' 
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Plugins:

ZSH_PLUGINS=$HOME/.zsh/

# zsh syntax highlighting
# available at https://github.com/zsh-users/zsh-syntax-highlighting
if [ -e $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Completion: this is significantly more fancy than bash's completion
# system!
# NB: keep at the bottom of the file; things break otherwise!
autoload -U compinit
compinit
