# Needed by https://github.com/yuutayamada/company-arduino#usage
export ARDUINO_HOME=$(nix-build --no-out-link "<nixpkgs>" -A arduino)
