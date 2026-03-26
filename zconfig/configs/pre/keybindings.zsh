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

# up/down arrows
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
# emacs mode
bindkey -M emacs "^P" history-substring-search-up
bindkey -M emacs "^N" history-substring-search-down
# vi mode
bindkey -M vicmd "k" history-substring-search-up
bindkey -M vicmd "j" history-substring-search-down

# Reset terminal modes that TUI apps (Claude Code, nvim, etc.) may leave enabled.
# Without this, exiting such apps can leave the terminal in a state where ZLE
# receives unexpected escape sequences instead of plain bytes, causing C-w/C-e
# to print raw symbols rather than triggering their ZLE widgets.
autoload -Uz add-zsh-hook

function _restore_terminal() {
  printf '\e[?1000l'  # disable mouse button reporting
  printf '\e[?1002l'  # disable mouse button+motion reporting
  printf '\e[?1003l'  # disable mouse all-motion reporting
  printf '\e[?2004l'  # disable bracketed paste mode
  printf '\e[<u'      # reset Kitty keyboard protocol (pop pushed flags)
  printf '\e[?1l'     # disable application cursor keys (DECCKM)
  printf '\e[?25h'    # ensure cursor is visible
}
add-zsh-hook precmd _restore_terminal
zle -N zle-line-init _restore_terminal
