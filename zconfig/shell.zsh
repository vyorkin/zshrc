if [[ $(uname) == "Darwin" ]]; then
  # Good ones are:
  # dark: blue-owl, cert, cobalt2, material, hotstick.minimal, agnoster, agnosterplus, the-unnamed
  # light: mt, pure
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
else
  eval "$(oh-my-posh init zsh --config ~/.poshthemes/pure.omp.json)"
fi

# https://zellij.dev/
# eval "$(zellij setup --generate-auto-start zsh)"
