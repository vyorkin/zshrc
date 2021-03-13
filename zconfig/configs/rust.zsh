if [ -x "$(command -v rustc)" ]; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

  PATH="$HOME/.cargo/bin:$PATH"
fi
