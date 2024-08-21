
# base, common
export PATH="$PATH:/Users/vyorkin/.bin:/Users/vyorkin/bin"

# huff, foundry, starknet
export PATH="$PATH:/Users/vyorkin/.huff/bin:/Users/vyorkin/.foundry/bin:/Users/vyorkin/.protostar/dist/protostar"

# emacs
export PATH="$PATH:/Users/vyorkin/.emacs.d/bin"

# https://github.com/wofr06/lesspipe
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# rust
if [ -x "$(command -v rustc)" ]; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

  PATH="$HOME/.cargo/bin:$PATH"
fi
