# vim syntax=zsh

# manually load heavy stuff if needed
# "x" is for "extended shell"
x() {
  case "$1" in
    nix)
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        # makes sense if not on nixos
        source ~/.nix-profile/etc/profile.d/nix.sh
      fi
      ;;
    js)
      if [[ "$OSTYPE" == linux* ]]; then
        export NVM_DIR="$HOME/.config/nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
      fi
      if [[ "$OSTYPE" == darwin* ]]; then
        # see output of `brew info nvm` for details
        export NVM_DIR="$HOME/.nvm"
        local nvm_prefix="${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm"
        [ -s "$nvm_prefix/nvm.sh" ] && \. "$nvm_prefix/nvm.sh"
        [ -s "$nvm_prefix/etc/bash_completion.d/nvm" ] && \. "$nvm_prefix/etc/bash_completion.d/nvm"
        echo "+ nvm loaded, nvm completion added"
      fi
      ;;
    haskell)
      [ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env
      echo "+ ghcup"
      ;;
    python)
      if [[ "$OSTYPE" == darwin* ]]; then
        local pybin
        pybin="$(python3 -c 'import sysconfig; print(sysconfig.get_path("scripts", "posix_user"))' 2>/dev/null)"
        [[ -n "$pybin" ]] && export PATH="$PATH:$pybin"
      fi
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"

      if command -v pyenv 1>/dev/null 2>&1; then
        eval "$(pyenv init - zsh)"
        eval "$(pyenv virtualenv-init -)"
      fi
      echo "+ python, pyenv"
      ;;
    emsdk)
      source "$HOME/emsdk/emsdk_env.sh"
      echo "+ emsdk"
      ;;
    openai)
      export OPENAI_API_KEY=$(pass show api/tokens/openai)
      echo "+ OPENAI_API_KEY exported"
      ;;
    ruby)
      eval "$(rbenv init -)"
      echo "+ rbenv initialized"
      ;;
    java)
      eval "$(jenv init -)"
      echo "+ jenv initialized"
      ;;
    go)
      export GOPATH="$HOME/go"
      PATH="$HOME/go/bin:$PATH"
      echo "+ go"
      ;;
    sml)
      PATH="/usr/local/smlnj/bin:$PATH"
      echo "+ smlnj"
      ;;
    kubectl)
      source <(kubectl completion zsh)
      echo "+ kubectl completion added"
      ;;
    terraform)
      local tf_bin="${HOMEBREW_PREFIX:-/opt/homebrew}/bin/terraform"
      [[ -x "$tf_bin" ]] && complete -o nospace -C "$tf_bin" terraform
      echo "+ terraform completion added"
      ;;
    yc)
      if [[ "$OSTYPE" == "darwin"* ]]; then
        [ -f "$HOME/yandex-cloud/path.bash.inc" ] && source "$HOME/yandex-cloud/path.bash.inc"
        [ -f "$HOME/yandex-cloud/completion.zsh.inc" ] && source "$HOME/yandex-cloud/completion.zsh.inc"
        echo "+ yandex"
      fi
      ;;
    ocaml)
      test -r "$HOME/.opam/opam-init/init.zsh" && . "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null || true
      eval "$(opam env)"
      echo "+ opam-init, opam env"
      ;;
    capstone)
      if [[ "$OSTYPE" == "darwin"* ]]; then
        # See: http://www.capstone-engine.org/documentation.html
        export DYLD_LIBRARY_PATH="/usr/local/opt/capstone/lib":$DYLD_LIBRARY_PATH
        echo "+ capstone"
      fi
      ;;
    julia)
      if [[ "$OSTYPE" == "darwin"* ]]; then
        # For argmin crate
        export DYLD_LIBRARY_PATH="/usr/local/gfortran/lib:$DYLD_LIBRARY_PATH"
        echo "+ julia"
      fi
      ;;
    gcloud)
      if [[ "$OSTYPE" == darwin* ]]; then
        # https://github.com/littleq0903/gcloud-zsh-completion
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
        source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
        echo "+ gcloud completions"
      fi
      ;;
    *)
      echo "Usage: x <env>"
      echo "Available: nix js haskell python emsdk openai ruby java go sml kubectl terraform yc ocaml capstone julia gcloud"
      return 1
      ;;
  esac
}
