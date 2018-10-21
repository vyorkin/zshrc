. ~/.zsh/setup

[[ -f ~/.dotsecrets/secret_tokens ]] && . ~/.dotsecrets/secret_tokens

if [[ `uname` == "Linux" ]]; then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi

