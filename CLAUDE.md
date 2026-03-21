# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Personal zsh configuration (dotfiles). Files are symlinked to `$HOME` via `setup.sh`, which prefixes each `z*` file with a dot (e.g., `zshrc` → `~/.zshrc`).

## Setup

```sh
# zinit is auto-installed on first shell start
# Optionally install zoxide for directory jumping: brew install zoxide
# Symlink all z* files to $HOME as dotfiles
./setup.sh
```

## Zsh Startup File Order

1. **zshenv** — environment vars loaded for every shell (nvim-gtk settings, fzf-marks, geometry prompt, cargo env)
2. **zprofile** — login shell: brew shellenv, PATH exports (homebrew, foundry, emacs, lean4, go, nvim)
3. **zshrc** — interactive shell: sources functions, aliases, configs (`setup.zsh`), direnv hook, secret tokens, plugins, `shell.zsh`, and platform-specific env
4. **zlogin** / **zlogout** — currently empty (mode comment only)

## Architecture: zconfig/

The `zconfig/` directory is the main configuration tree, symlinked as `~/.zconfig`:

- **`setup.zsh`** — defines `load_configs()` which sources files from `configs/` in three phases: `pre/` first, then root-level, then `post/`. Skips `.zwc` compiled files.
- **`configs/pre/`** — early config: shell options, history, editor (`nvim`), keybindings (emacs mode with custom bindings), locale, colors, XDG, pushd settings
- **`plugins.zsh`** — zinit plugin declarations: history-substring-search, autosuggestions, completions, fast-syntax-highlighting; zoxide for directory jumping
- **`aliases/`** — alias files by domain (git, docker, editors, go, haskell, javascript, tmux). No file extensions — sourced directly.
- **`functions/`** — `.zsh` files, mostly fzf-powered interactive utilities (branch switching, history search, process killing, directory navigation)
- **`completions/`** — custom completion files (`_cargo`, `_cast`, `_forge`, `_rustup`)

## Key Conventions

- Alias files have no extension; function/config files use `.zsh`
- Editor is nvim (`$VISUAL` and `$EDITOR`)
- Keybindings use emacs mode (`bindkey -e`) with vi-cmd-mode on `^S`
- Secret tokens live in `~/.secret_tokens` (gitignored, sourced if present)
- Platform-specific code guarded by `[[ $(uname) == "Darwin" ]]` or `$OSTYPE` checks
