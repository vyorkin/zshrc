ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  print -P "%F{33}Installing zinit...%f"
  mkdir -p "$(dirname "$ZINIT_HOME")"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Early loads (keybindings and completions depend on these)
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search

# Turbo mode (deferred) for faster startup
zinit wait lucid for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  zdharma-continuum/fast-syntax-highlighting

# zoxide (faster replacement for zsh-z) — install via: brew install zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi
