Inspired by https://github.com/thoughtbot/dotfiles

# Setup

Plugin manager ([zinit](https://github.com/zdharma-continuum/zinit)) auto-installs on first shell launch. Or install manually:

```sh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Run the setup script that symlinks `z*`-files to your `$HOME` dir:

```sh
./setup.sh
```

# SDK's and PATH

## Emscripten

Clone [emsdk](https://github.com/emscripten-core/emsdk.git) to `~/emsdk`:

```sh
git clone https://github.com/emscripten-core/emsdk.git ~/emsdk
```

# Secret tokens

Your secret tokens should be in `~/secret_tokens`:

```
export SRC_ENDPOINT=https://sourcegraph.com
export SRC_ACCESS_TOKEN={your_src_token}
```
