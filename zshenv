# keep only the first occurence of each duplicated value in path
typeset -U path

if [[ `uname` == "Darwin" ]]; then
  # /usr/local/opt/llvm/bin
  path=(
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.rbenv/bin
    $HOME/.psvm/current/bin
    $HOME/.cargo/bin
    $HOME/.cabal/bin
    /usr/local/i386elfgcc/bin
    /usr/local/x8664pcelfgcc/bin/
    $HOME/Library/Python/3.6/bin
    /usr/local/opt/texinfo/bin
    /usr/local/opt/erlang@21/bin
    /usr/local/opt/openssl/bin
    $GOPATH/bin
    $path
  )
elif [[ `uname -r` == *"ARCH" ]]; then
  path=(
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $GOPATH/bin
    $HOME/.cargo/bin
    $HOME/.cabal/bin
    /usr/local/opt/openssl/bin
    $path
  )
fi
