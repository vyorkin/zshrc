nixify() {
  if [ ! -e ./.envrc ]; then
    echo "use nix" > .envrc
    direnv allow
  fi
}

# Generate Nix expression to build NPM package.
n2nix() {
  node2nix --input <( echo "[\"$1\"]")
}

gc() {
  # Delete old generations of all profiles, then collect garbage
  sudo nix-collect-garbage -d
}

gca() {
  # Download a new version of the nixpkgs channel,
  # which holds the description of all the software
  # UPD: I don't use channels anymore, submodules ftw

  # nix-channel --update

  # Upgrade installed packages.
  # UPD: I don't use nix-env for package management
  # nix-env -u --always

  # Beware, this will result in dangling symlinks.
  # You may be smarter and also remove the target of those symlinks.
  sudo rm -f /nix/var/nix/gcroots/auto/*

  sudo nix optimise-store
  # Re-generate apropos db
  su -l root -c mandb
}

sw() {
  sudo nixos-rebuild switch
  nmcli radio wifi off
  nmcli radio wifi on
  kb
}
