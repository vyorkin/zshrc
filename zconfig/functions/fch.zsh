# fch is for "fucking cabal hell"
# see https://github.com/serras/emacs-haskell-tutorial/blob/master/tutorial.md#dealing-with-cabal-hell
# for more info
fch() {
  rm -rf `find ~/.ghc -maxdepth 1 -type d`
  rm -rf ~/.cabal/lib
  rm -rf ~/.cabal/packages
  rm -rf ~/.cabal/share
}
