# give us access to ^Q
stty -ixon

# zsh does not use readline.
# instead it uses Zsh Line Editor (ZLE).
# here we set the emacs mode explicitly.
bindkey -e

bindkey "^S" vi-cmd-mode
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# up/down arrows
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
# emacs mode
bindkey -M emacs "^P" history-substring-search-up
bindkey -M emacs "^N" history-substring-search-down
# vi mode
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down
