# -*- mode: sh -*-

export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_NO_WINDOW_DECORATION=1
export NVIM_GTK_PREFER_DARK_THEME=1

if [ -x "$(command -v hoogle)" ]; then
  export HIE_HOOGLE_DATABASE="$(cat $(which hoogle) | sed -n -e 's|.*--database \(.*\.hoo\).*|\1|p')"
fi
