

# Generate Nix expression to build NPM package.
function n2nix() {
  node2nix --input <( echo "[\"$1\"]")
}


function gc() {
  # Download a new version of the nixpkgs channel,
  # which holds the description of all the software
  # UPD: I don't use channels anymore, submodules ftw

  # nix-channel --update

  # Upgrade installed packages.
  # UPD: I don't use nix-env for package management
  # nix-env -u --always

  # Beware, this will result in dangling symlinks.
  # You may be smarter and also remove the target of those symlinks.
  sudo rm /nix/var/nix/gcroots/auto/*
  # Delete old generations of all profiles, then collect garbage
  sudo nix-collect-garbage -d
}

function sw() {
  sudo nixos-rebuild switch
  nmcli radio wifi off
  nmcli radio wifi on
  kb
}