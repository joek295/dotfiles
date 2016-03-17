# -*- sh -*-

setopt AUTO_LIST        # tabbing on an ambiguously incomplete command lists possibilities
#setopt MENU_COMPLETE    # tabbing on an ambiguously incomplete command selects first possibility
setopt COMPLETE_IN_WORD # tabbing in the middle of a word will try to complete that word
setopt ALWAYS_TO_END    # when completing from middle of word, move cursor to end of that word
setopt COMPLETE_ALIASES
setopt AUTO_PARAM_SLASH 

fpath=(/home/joe/dotfiles/zsh.d/zsh-completion $fpath)

#zmodload -i zsh/complist

zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# smart case-sensitive completion: only case sensitive when including upper case
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:expand:*' tag-order all-expansions
# zsh better completion of kill command:
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# completion for my functions...
zstyle ':completion:*:*:extract:*' file-patterns '*.tar *.*bz2 *.*gz *.xz *.rar *.cbr *.zip *.cbz *.Z *.7z *(-/)'
zstyle ':completion:*:*:pdf:*' file-patterns '*.tex *(-/)'

autoload -U compinit && compinit
compdef mtoc=man
compdef fortune=myfortune
compdef la=ls
compdef ll=ls
compdef lp=ls
compdef lr=ls
compdef lal=ls
compdef lla=ls
