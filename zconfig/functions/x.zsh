# vim: set syntax=zsh:

# manually load heavy stuff if needed
# "x" is for "extended shell"
function x() {
  if [[ $1 = nix ]]; then
    if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
      # makes sense if not on nixos
      . ~/.nix-profile/etc/profile.d/nix.sh
    fi
  elif [[ $1 = js ]]; then
    echo "+ nvm"
    if [[ `uname -r` == *"ARCH" ]]; then
      . /usr/share/nvm/init-nvm.sh
    fi
    if [[ `uname` == "Darwin" ]]; then
      # see output of `brew info nvm` for details
      export NVM_DIR="$HOME/.nvm"
      . "/usr/local/opt/nvm/nvm.sh"
    fi
  elif [[ $1 = ruby ]]; then
    echo "+ rbenv"
    eval "$(rbenv init -)"
  elif [[ $1 = java ]]; then
    echo "+ jenv"
    eval "$(jenv init -)"
  elif [[ $1 = ocaml ]]; then
    echo "+ opam"
    . ~/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
  elif [[ $1 = gcloud ]]; then
    echo "+ gcloud"
    if [[ `uname` == "Darwin" ]]; then
      # https://github.com/littleq0903/gcloud-zsh-completion
      # others: https://github.com/unixorn/awesome-zsh-plugins#even-more-completions
      . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
      . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
    fi
  else
    echo "+ fzf"
    echo "+ bashhub"
    echo "+ travis ci"
    [[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh
    [[ -f ~/.bashhub/bashhub.zsh ]] && . ~/.bashhub/bashhub.zsh
    [[ -f ~/.travis/travis.sh ]] && . ~/.travis/travis.sh
  fi
}

