# .zshrc is the equivalent of .bashrc & .kshrc

ZSH_PLUGINS=$HOME/dotfiles/zsh.d

ALIASES=$HOME/dotfiles/sh.d/aliases
COMPLETION=$ZSH_PLUGINS/completions.zsh
FUNCTIONS=$HOME/dotfiles/sh.d/functions
HISTORY=$ZSH_PLUGINS/history.zsh
KEYS=$ZSH_PLUGINS/keys.zsh
PROMPT=$ZSH_PLUGINS/prompt.zsh
ZALIASES=$ZSH_PLUGINS/aliases.zsh

if [ -f $ALIASES ]; then
  source $ALIASES
fi

if [ -f $ZALIASES ]; then
    source $ZALIASES
fi

if [ -f $FUNCTIONS ]; then
    source $FUNCTIONS
fi

if [ -e $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source $HISTORY

setopt NO_BEEP
setopt INTERACTIVE_COMMENTS
setopt MULTIOS
# With this set, myshell() (in functions) can work in zsh
setopt POSIX_ARGZERO

# cd options:
setopt AUTO_CD
setopt CDABLEVARS
setopt PUSHD_IGNORE_DUPS

# automatic completion options:
setopt GLOB_COMPLETE    
setopt GLOB_SUBST
setopt EXTENDEDGLOB

if [ -f $KEYS ]; then
  source $KEYS
fi

autoload -U colors && colors

source $PROMPT

# zsh syntax highlighting
# available at https://github.com/zsh-users/zsh-syntax-highlighting

source $COMPLETION
