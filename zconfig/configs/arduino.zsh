# Needed by https://github.com/yuutayamada/company-arduino#usage
if [ -x $(command -v nixos-version) ]; then
  export ARDUINO_HOME=$(nix-build --no-out-link "<nixpkgs>" -A arduino)
fi
