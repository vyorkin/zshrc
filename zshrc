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

# mt, agnoster/agnosterplus, blue-owl, the-unnamed,
# cert, cobalt2, hotstick.minimal, material,
eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/hotstick.minimal.omp.json)"
