# vim: set syntax=zsh

# load custom executable functions and aliases
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

export PATH="$PATH:/Users/vyorkin/.protostar/dist/protostar"

export PATH="$PATH:/Users/vyorkin/.bin"

export OPENAI_API_KEY='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'
