# vim: set syntax=zsh

# load custom executable functions and aliases
# aliases should be defined before running function like "compdef"
for f in ~/.zconfig/functions/*; do source $f; done
for f in ~/.zconfig/aliases/*; do source $f; done

. ~/.zconfig/setup.zsh

eval "$(direnv hook zsh)"

[[ -f ~/.secret_tokens ]] && . ~/.secret_tokens

bindkey '^Y' fuzzy-search-and-edit

. ~/.zconfig/plugins.zsh

# Good ones are:
# dark: blue-owl, cert, cobalt2, material, hotstick.minimal, agnoster, agnosterplus, the-unnamed
# light: mt, pure
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
