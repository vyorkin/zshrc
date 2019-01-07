if [[ `uname -r` == *"ARCH" ]]; then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
