# setup keyboard
kb() {
  xset r rate 300 65
  xcape -e 'Caps_Lock=Escape;Control_L=Escape;Control_R=Escape'
  xmodmap ~/.Xmodmap
  xbindkeys
}
