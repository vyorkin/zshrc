# vim syntax=zsh

# manually load heavy stuff if needed
# "x" is for "extended shell"
x() {
  if [[ $1 = nix ]]; then
    if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
      # makes sense if not on nixos
      source ~/.nix-profile/etc/profile.d/nix.sh
    fi
  elif [[ $1 = js ]]; then
    if [[ `uname -r` == *"generic" ]]; then
      export NVM_DIR="$HOME/.config/nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi
    if [[ `uname` == "Darwin" ]]; then
      # see output of `brew info nvm` for details
      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
      echo "+ nvm loaded, nvm completion added"
    fi

  elif [[ $1 = haskell ]]; then
    [ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
    echo "+ ghcup"
  elif [[ $1 = python ]]; then
    # python
    export PATH="$PATH:$HOME/Library/Python/3.11/bin"
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    if command -v pyenv 1>/dev/null 2>&1; then
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)"
    fi
    echo "+ python, pyenv"
  elif [[ $1 = emsdk ]]; then
    source $HOME/emsdk/emsdk_env.sh
    echo "+ emsdk"
  elif [[ $1 = openai ]]; then
    export OPENAI_API_KEY=$(pass show api/tokens/openai)
    echo "+ OPENAI_API_KEY exported"
  elif [[ $1 = ruby ]]; then
    eval "$(rbenv init -)"
    echo "+ rbenv initialized"
  elif [[ $1 = java ]]; then
    eval "$(jenv init -)"
    echo "+ jenv initialized"
  elif [[ $1 = go ]]; then
    export GOPATH="$HOME/go"
    PATH="$HOME/go/bin:$PATH"
    echo "+ go"
  elif [[ $1 = sml ]]; then
    PATH="/usr/local/smlnj/bin:$PATH"
    echo "+ smlnj"
  elif [[ $1 =  kubectl ]]; then
    source <(kubectl completion zsh)
    echo "+ kubectl completion added"
  elif [[ $1 =  terraform ]]; then
    # terraform
    complete -o nospace -C /opt/homebrew/bin/terraform terraform
    echo "+ terraform completion added"
  elif [[ $1 = yc ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # The next line updates PATH for Yandex Cloud CLI
      if [ -f "$HOME/yandex-cloud/path.bash.inc" ]; then source "$HOME/yandex-cloud/path.bash.inc"; fi
      # The next line enables shell command completion for YC
      if [ -f "$HOME/yandex-cloud/completion.zsh.inc" ]; then source "$HOME/yandex-cloud/completion.zsh.inc"; fi
      echo "+ yandex"
    fi
  elif [[ $1 = ocaml ]]; then
    test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
    echo "+ opam initialized"
  elif [[ $1 = capstone ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # Capstone
      # See: http://www.capstone-engine.org/documentation.html
      export DYLD_LIBRARY_PATH="/usr/local/opt/capstone/lib":$DYLD_LIBRARY_PATH
      echo "+ capstone"
    fi
  elif [[ $1 = julia ]]; then
    # dyld
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # For jlrs crate
      # See: https://github.com/Taaitaaiger/jlrs#macos, https://github.com/Taaitaaiger/jlrs#linux
      #
      # export DYLD_LIBRARY_PATH=/Applications/Julia-1.9.app/Contents/Resources/julia/include/julia:/Applications/Julia-1.9.app/Contents/Resources/julia/lib/julia
      # export DYLD_LIBRARY_PATH=$(which julia)/../../include/julia:$DYLD_LIBRARY_PATH
      # export JULIA_DIR="$(dirname $(dirname $(which julia)))"
      # export DYLD_LIBRARY_PATH="${JULIA_DIR}/lib:${JULIA_DIR}/lib/julia:${DYLD_LIBRARY_PATH}"

      # For argmin crate
      export DYLD_LIBRARY_PATH="/usr/local/gfortran/lib:$DYLD_LIBRARY_PATH"
      echo "+ julia"
    fi
  elif [[ $1 = gcloud ]]; then
    if [[ `uname` == "Darwin" ]]; then
      # https://github.com/littleq0903/gcloud-zsh-completion
      # others: https://github.com/unixorn/awesome-zsh-plugins#even-more-completions
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
      source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
      echo "+ gcloud completions"
    fi
  fi
}
