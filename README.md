Inspired by https://github.com/thoughtbot/dotfiles

# Setup

## Prerequisites

- [Homebrew](https://brew.sh/) (macOS)
- [direnv](https://direnv.net/) — `brew install direnv`
- [fzf](https://github.com/junegunn/fzf) — `brew install fzf`
- [oh-my-posh](https://ohmyposh.dev/) — `brew install oh-my-posh`
- [zoxide](https://github.com/ajeetdsouza/zoxide) — `brew install zoxide`
- [neovim](https://neovim.io/) — `brew install neovim`

## Install

The plugin manager ([zinit](https://github.com/zdharma-continuum/zinit)) auto-installs on first shell launch. Or install manually:

```sh
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

Run the setup script to symlink all `z*` files to `$HOME` as dotfiles (e.g., `zshrc` -> `~/.zshrc`):

```sh
./setup.sh
```

The `zconfig/` directory is also symlinked as `~/.zconfig`.

# How it works

## Startup file order

Zsh sources files in this order:

1. **zshenv** — loaded for every shell (interactive, non-interactive, scripts). Sets environment variables: nvim-gtk, fzf-marks, geometry prompt, Rust/cargo env.
2. **zprofile** — login shells only. Initializes Homebrew, sets up PATH (foundry, emacs, lean4, go, nvim).
3. **zshrc** — interactive shells. This is the main entrypoint that loads everything below.
4. **zlogin** / **zlogout** — currently unused.

## zshrc load sequence

```
zshrc
 |-- source zconfig/functions/*    # fzf utilities, helpers
 |-- source zconfig/aliases/*      # aliases by domain
 |-- source zconfig/setup.zsh      # three-phase config loader
 |     |-- configs/pre/*           # shell options, history, keybindings, completion, etc.
 |     |-- configs/*               # root-level configs (if any)
 |     \-- configs/post/*          # late-stage configs (if any)
 |-- direnv hook
 |-- ~/.secret_tokens              # secret env vars (gitignored)
 |-- zconfig/plugins.zsh           # zinit plugins
 \-- zconfig/shell.zsh             # oh-my-posh prompt
```

## Directory structure

```
.
├── zshenv                          # env vars for all shells
├── zprofile                        # login shell PATH setup
├── zshrc                           # interactive shell entrypoint
├── zlogin / zlogout                # unused
├── setup.sh                        # symlink installer
└── zconfig/
    ├── setup.zsh                   # three-phase config loader
    ├── plugins.zsh                 # zinit plugin declarations
    ├── shell.zsh                   # prompt (oh-my-posh)
    ├── configs/
    │   └── pre/
    │       ├── options.zsh         # globbing, safety (noclobber, rm * confirm)
    │       ├── history.zsh         # shared history, dedup, 100k lines
    │       ├── keybindings.zsh     # emacs mode + custom bindings
    │       ├── completion.zsh      # completion styles, caching, colors
    │       ├── editor.zsh          # VISUAL/EDITOR = nvim
    │       ├── color.zsh           # terminal color support
    │       ├── locale.zsh          # UTF-8
    │       ├── xdg.zsh            # XDG base directories
    │       └── pushd.zsh          # directory stack settings
    ├── aliases/                    # alias files by domain (no extension)
    │   ├── git                     # gs, gc, gp, gd, gl, ...
    │   ├── shell                   # ls, grep, navigation, global pipes
    │   ├── docker                  # docker & docker-compose shortcuts
    │   ├── editors                 # emacs daemon/client
    │   ├── folders                 # project directory shortcuts
    │   ├── javascript              # yarn shortcuts
    │   ├── haskell                 # cabal, stack, haddock
    │   ├── go                      # go workspace
    │   └── tmux                    # tmux init
    ├── functions/                  # .zsh files, mostly fzf-powered
    │   ├── fb.zsh                  # fuzzy local branch checkout
    │   ├── fbr.zsh                 # fuzzy branch checkout (incl. remotes)
    │   ├── fcoc.zsh                # fuzzy commit checkout
    │   ├── fcs.zsh                 # fuzzy commit SHA picker
    │   ├── fshow.zsh               # interactive git log browser
    │   ├── fh.zsh                  # fuzzy history search
    │   ├── fkill.zsh               # fuzzy process kill
    │   ├── fdd.zsh                 # fuzzy directory cd
    │   ├── fdr.zsh                 # fuzzy parent directory cd
    │   ├── fheader.zsh             # find macOS SDK headers (Darwin only)
    │   ├── ca.zsh                  # bc calculator
    │   ├── mkd.zsh                 # mkdir + cd
    │   ├── x.zsh                   # lazy-load heavy environments
    │   └── fireb.zsh               # firebase CLI wrapper
    └── completions/                # custom completion functions
        ├── _cargo
        ├── _cast
        ├── _forge
        └── _rustup
```

# Usage

## Lazy-loading with `x`

Heavy SDKs and runtimes are not loaded at startup. Use `x <env>` to load them on demand:

```sh
x js        # nvm + node
x python    # pyenv + virtualenv
x haskell   # ghcup
x ruby      # rbenv
x java      # jenv
x go        # GOPATH + bin
x ocaml     # opam
x nix       # nix-profile
x emsdk     # emscripten
x kubectl   # kubectl completion
x terraform # terraform completion
x gcloud    # gcloud SDK + completion
x yc        # yandex cloud CLI
x openai    # export OPENAI_API_KEY from pass
x sml       # SML/NJ
x capstone   # capstone engine (macOS)
x julia     # julia/gfortran libs (macOS)
```

## Directory jumping with zoxide

[zoxide](https://github.com/ajeetdsouza/zoxide) learns directories you visit and lets you jump to them:

```sh
z foo       # cd to the most frecent directory matching "foo"
zi foo      # interactive selection with fzf
```

## fzf functions

All `f*` functions use [fzf](https://github.com/junegunn/fzf) for interactive filtering:

| Command  | Description                              |
|----------|------------------------------------------|
| `fb`     | Checkout a local git branch              |
| `fbr`    | Checkout any branch (including remotes)  |
| `fshow`  | Browse git log interactively             |
| `fcs`    | Pick a commit SHA (for rebase, etc.)     |
| `fcoc`   | Checkout a specific commit               |
| `fh`     | Search shell history                     |
| `fkill`  | Kill a process                           |
| `fdd`    | cd into a subdirectory                   |
| `fdr`    | cd into a parent directory               |
| `fheader`| Browse macOS SDK headers (Darwin only)   |

## Plugins

Managed by [zinit](https://github.com/zdharma-continuum/zinit) with turbo mode for fast startup:

- **zsh-completions** — additional completion definitions
- **zsh-history-substring-search** — type and press up/down to search history
- **zsh-autosuggestions** — fish-like autosuggestions (deferred)
- **fast-syntax-highlighting** — command highlighting (deferred)

## Secret tokens

Create `~/.secret_tokens` for private environment variables (sourced if present, gitignored):

```sh
export SRC_ENDPOINT=https://sourcegraph.com
export SRC_ACCESS_TOKEN={your_src_token}
```

## Key conventions

- Alias files have no extension; function/config files use `.zsh`
- Editor is `nvim` (`$VISUAL` and `$EDITOR`)
- Keybindings use emacs mode (`bindkey -e`) with `^S` for vi-cmd-mode
- Platform-specific code guarded by `$OSTYPE` checks
- Space-prefixed commands are excluded from history (for typing secrets)

# SDK's and PATH

## Emscripten

Clone [emsdk](https://github.com/emscripten-core/emsdk.git) to `~/emsdk`:

```sh
git clone https://github.com/emscripten-core/emsdk.git ~/emsdk
```
