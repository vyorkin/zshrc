# Keep only the first occurence of each duplicated value
typeset -U path

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTCONTROL=ignoreboth
export XDG_CONFIG_HOME="$HOME/.config"

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

# Zsh does not use readline.
# Instead it uses Zsh Line Editor (ZLE).
# Here we set the emacs mode explicitly.
bindkey -e

export EDITOR=nvim

. $HOME/.dotsecrets/secret_tokens

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "~/.zshrc"
autoload -Uz compinit
compinit
# End of lines added by compinstall

# enable bash completion compatibility mode
autoload bashcompinit
bashcompinit

. $HOME/.zplugins

if [[ "$OSTYPE" == "darwin"* ]]; then
  path=(
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.rbenv/bin
    $HOME/.psvm/current/bin
    $HOME/.cargo/bin
    /usr/local/opt/llvm/bin
    /usr/local/i386elfgcc/bin
    /usr/local/x8664pcelfgcc/bin/
    $HOME/Library/Python/3.6/bin
    /usr/local/opt/texinfo/bin
    /usr/local/opt/erlang@19/bin
    $GOPATH/bin
    $path
  )
else
  path=(
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $GOPATH/bin
    $HOME/.cargo/bin
    $path
  )
 fi

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export GOPATH="$HOME/go"

if [[ "$OSTYPE" == "darwin"* ]]; then
  export DYLD_LIBRARY_PATH=/usr/local/opt/capstone/lib/:$DYLD_LIBRARY_PATH
fi

# load custom functions & aliases
source $HOME/.helpers/index

export ERL_AFLAGS="-kernel shell_history enabled"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
