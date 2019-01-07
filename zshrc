# load custom executable functions and aliases
for f in ~/.zsh/functions/*; do source $f; done
for f in ~/.zsh/aliases/*; do source $f; done

. ~/.zsh/setup

[[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens
