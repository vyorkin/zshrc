
# base, common
export PATH="$PATH:$HOME/.bin:$HOME/bin"

# huff, foundry, starknet
export PATH="$PATH:$HOME/.huff/bin:$HOME/.config/.foundry/bin:$HOME/.protostar/dist/protostar"

# emacs
export PATH="$PATH:$HOME/.emacs.d/bin"

# https://github.com/wofr06/lesspipe
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1

# rust
if [ -x "$(command -v rustc)" ]; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

  PATH="$HOME/.cargo/bin:$PATH"
fi
