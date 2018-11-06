DIRSTACKSIZE=10

# cd movements

setopt auto_pushd        # make cd push old dir in dir stack
setopt pushd_ignore_dups # no duplicates in dir stack
setopt pushd_silent      # no dir stack after pushd or popd
setopt pushd_to_home     # `pushd` = `pushd $HOME`
setopt cdablevars        #
