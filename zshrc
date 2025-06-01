# vim: set syntax=zsh

# load custom executable functions and aliases
# aliases should be defined before running function like "compdef"
for f in ~/.zconfig/functions/*; do source $f; done
for f in ~/.zconfig/aliases/*; do source $f; done

. ~/.zconfig/setup.zsh

# see: https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"

[[ -f ~/.secret_tokens ]] && . ~/.secret_tokens

. ~/.zconfig/plugins.zsh
. ~/.zconfig/shell.zsh

. "$HOME/.local/bin/env"
