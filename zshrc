# vim: set syntax=zsh

# load custom executable functions and aliases
# aliases should be defined before running function like "compdef"
for f in ~/.zconfig/functions/*; do source "$f"; done
for f in ~/.zconfig/aliases/*; do source "$f"; done

. ~/.zconfig/setup.zsh

# see: https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

[[ -f ~/.secret_tokens ]] && . ~/.secret_tokens

. ~/.zconfig/plugins.zsh
. ~/.zconfig/shell.zsh

if [[ "$OSTYPE" == darwin* ]]; then
  . "$HOME/.local/bin/env"
fi

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
