# Needed by https://github.com/yuutayamada/company-arduino#usage
if command -v nixos-version > /dev/null; then
  export ARDUINO_HOME=$(nix-build --no-out-link "<nixpkgs>" -A arduino)
fi
