# -*- mode: sh -*-

export NVIM_GTK_NO_HEADERBAR=1
export NVIM_GTK_NO_WINDOW_DECORATION=1
export NVIM_GTK_PREFER_DARK_THEME=1

if [ -x "$(command -v hoogle)" ]; then
  export HIE_HOOGLE_DATABASE="$(cat $(which hoogle) | sed -n -e 's|.*--database \(.*\.hoo\).*|\1|p')"
fi

export FZF_MARKS_JUMP="^x^j"
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="> "

# export GEOMETRY_PROMPT_SUFFIX=$(if [ ! -z $IN_NIX_SHELL ] then echo ' [nix]' fi)

export GEOMETRY_GIT_SYMBOL_STASHES="x"     # change the git stash indicator to `x`
export GEOMETRY_GIT_GREP="rg"              # define which grep-like tool to use (By default it looks for rg, ag and finally grep)
export GEOMETRY_GIT_NO_COMMITS_MESSAGE=""  # hide the 'no commits' message in new repositories
export GEOMETRY_GIT_TIME_DETAILED=true     # show full time (e.g. `12h 30m 53s`) instead of the coarsest interval (e.g. `12h`)

. "$HOME/.cargo/env"
