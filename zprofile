# -*- mode: sh -*-

if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# base, common
export PATH="$PATH:$HOME/.bin:$HOME/bin"

# huff, foundry, starknet
export PATH="$PATH:$HOME/.huff/bin:$HOME/.config/.foundry/bin:$HOME/.protostar/dist/protostar"

# emacs
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.config/emacs/bin"

# lean4
export PATH="$PATH:$HOME/.elan/bin"

# https://github.com/wofr06/lesspipe
if [[ -x /opt/homebrew/bin/lesspipe.sh ]]; then
  export LESSOPEN="|/opt/homebrew/bin/lesspipe.sh %s"
fi

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/opt/nvim/"
