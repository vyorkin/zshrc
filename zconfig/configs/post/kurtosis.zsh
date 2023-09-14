# Add Kurtosis command-line completion
source <(kurtosis completion zsh)
compdef _kurtosis kurtosis

# Add command-line completion to Kurtosis alias
compdef __start_kurtosis kt
