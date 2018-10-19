. ~/.zsh/setup

# load custom functions & aliases
[[ -f ~/.helpers/index ]] && . ~/.helpers/index
# load secret tokens
[[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens
# load local config
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

if [[ `uname` == "Linux" ]]; then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi

