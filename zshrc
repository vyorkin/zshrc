# vim: set syntax=zsh:

# load custom executable functions and aliases
for f in ~/.zconfig/functions/*; do source $f; done
for f in ~/.zconfig/aliases/*; do source $f; done

. ~/.zconfig/setup.zsh

eval "$(direnv hook zsh)"

[[ -f ~/.secret_tokens ]] && . ~/.secret_tokens

bindkey '^Y' fuzzy-search-and-edit

if ! command -v nixos-version > /dev/null; then
  . ~/.zconfig/plugins.zsh
fi
