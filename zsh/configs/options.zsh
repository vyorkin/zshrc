# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=10

# enable extended globbing
setopt extendedglob

setopt globcomplete nocaseglob

# allow [ or ] wherever you want
unsetopt nomatch

# auto insert -v options
# for c in cp rm chmod rename mv perl-rename mkdir; do
#   alias $c="$c -v"
# done

