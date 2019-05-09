zstyle :compinstall filename "~/.zshrc"
autoload -Uz compinit

# `-u` is to prevent the "zsh compinit: insecure directories"
compinit -u

# enable bash completion compatibility mode
autoload -U +X bashcompinit && bashcompinit

zmodload -i zsh/complist
setopt hash_list_all     # hash everything before completion
setopt completealiases   # complete alisases
setopt always_to_end     # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word  # allow completion from within a word/phrase
setopt correct           # spelling correction for commands
setopt list_ambiguous    # complete as much of a completion until it gets ambiguous.

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case

# activate selection menu (if number of items > 2)
zstyle ':completion:*' menu select=2
# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
# limit to 2 errors
zstyle ':completion:*:approximate:*' max-errors 2
# or to have a better heuristic, by allowing one error per 3 character typed
# zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# color completion for some things
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' verbose yes
zstyle ':completion:*:manuals' separate-sections true

# format descriptions (notice the vt100 escapes)
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}> %B%d%b%{\e[0m%}'
# zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"

# bold and underline normal messages
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
# zstyle ':completion:*:messages' format '%d'

# format in bold red error messages
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
# zstyle ':completion:*:warnings' format "$fg[red]no matches for:$reset_color %d"

zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# use the tag name as group name
zstyle ':completion:*' group-name ''

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb

# because I don't care about others
users=(vyorkin root)
zstyle ':completion:*' users $users
