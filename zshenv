# keep only the first occurence of each duplicated value in path
typeset -U path

if [[ "$OSTYPE" == "darwin"* ]]; then
  path=(
    /usr/local/sbin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.rbenv/bin
    $HOME/.psvm/current/bin
    $HOME/.cargo/bin
    $HOME/.cabal/bin
    /usr/local/opt/llvm/bin
    /usr/local/i386elfgcc/bin
    /usr/local/x8664pcelfgcc/bin/
    $HOME/Library/Python/3.6/bin
    /usr/local/opt/texinfo/bin
    /usr/local/opt/erlang@21/bin
    /usr/local/opt/openssl/bin
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
    $HOME/.cabal/bin
    /usr/local/opt/openssl/bin
    $path
  )
 fi
