# workaround for patches-ghc-paths
# see: https://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure
if [ -e ~/.nix-profile/bin/ghc ]; then
  export NIX_GHC="$HOME/.nix-profile/bin/ghc"
  export NIX_GHCPKG="$HOME/.nix-profile/bin/ghc-pkg"
  export NIX_GHC_DOCDIR="$HOME/.nix-profile/share/doc/ghc/html"
  export NIX_GHC_LIBDIR="$HOME/.nix-profile/lib/ghc-$($NIX_GHC --numeric-version)"
fi

# add stack compiler-tools to PATH
PATH=$HOME/.local/bin:$PATH
# PATH=$(stack path --compiler-tools-bin):$PATH
