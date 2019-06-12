# -*- mode: sh -*-

# load custom executable functions and aliases
for f in ~/.zconfig/functions/*; do source $f; done
for f in ~/.zconfig/aliases/*; do source $f; done

. ~/.zconfig/setup.zsh

[[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens
