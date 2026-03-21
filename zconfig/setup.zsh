# vim syntax=zsh

# extra files in ~/.zconfig/configs/pre, ~/.zconfig/configs, and ~/.zconfig/configs/post
# these are loaded first, second and third, respectively.
load_configs() {
  local dir="$1"
  [[ -d "$dir" ]] || return

  local config phase
  for phase in pre "" post; do
    local target="$dir${phase:+/$phase}"
    [[ -d "$target" ]] || continue
    for config in "$target"/**/*(N-.); do
      [[ ${config:e} == zwc ]] && continue
      # In root phase, skip pre/ and post/ subdirectories
      if [[ -z "$phase" ]]; then
        case "$config" in
          "$dir"/pre/*|"$dir"/post/*) continue ;;
        esac
      fi
      . "$config"
    done
  done
}

load_configs "$HOME/.zconfig/configs"
