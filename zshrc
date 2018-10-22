zstyle :compinstall filename "~/.zshrc"
autoload -Uz compinit
compinit

# enable bash completion compatibility mode
autoload bashcompinit
bashcompinit

# load custom executable functions and aliases
for f in ~/.zsh/functions/*; do source $f; done
for f in ~/.zsh/aliases/*; do source $f; done

. ~/.zsh/setup

[[ -f ~/.zsh/plugins ]] && . ~/.zsh/plugins
[[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens
