. ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "geometry-zsh/geometry"
zplug "chisui/zsh-nix-shell"
zplug "agkozak/zsh-z"
zplug "djui/alias-tips"
zplug "unixorn/git-extra-commands"
zplug "mafredri/zsh-async"
zplug "zdharma/fast-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
