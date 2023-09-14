# enable extended globbing
setopt extendedglob

setopt globcomplete
setopt nocaseglob

# allow [ or ] wherever you want
unsetopt nomatch

# get notified when someone logs in
watch=all   # watch all logins
logcheck=30 # every 30 seconds
WATCHFMT="%n from %M has %a tty%l at %T %W"

setopt auto_cd           # if command is a path, cd into it
setopt auto_remove_slash # self explicit
setopt chase_links       # resolve symlinks
setopt correct           # try to correct spelling of commands
setopt extended_glob     # activate complex pattern globbing
setopt glob_dots         # include dotfiles in globbing
setopt print_exit_value  # print return value if non-zero

unsetopt beep            # no bell on error
unsetopt bg_nice         # no lower prio for background jobs
unsetopt clobber         # must use >| to truncate existing files
unsetopt hist_beep       # no bell on error in history
unsetopt hup             # no hup signal at shell exit
unsetopt ignore_eof      # do not exit on end-of-file
unsetopt list_beep       # no bell on ambiguous completion
unsetopt rm_star_silent  # ask for confirmation for `rm *' or `rm path/*'
