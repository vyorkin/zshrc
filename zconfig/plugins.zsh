. ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chisui/zsh-nix-shell"
zplug "agkozak/zsh-z"
zplug "MichaelAquilina/zsh-you-should-use"
# zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
zplug "zdharma-continuum/fast-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

