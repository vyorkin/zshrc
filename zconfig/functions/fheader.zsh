# find header files
fheader() {
    local files
    files=$(find $(xcrun --show-sdk-path)/usr/include -name "*.h" | fzf -m --preview="head -20 {}")
    [ -n "$files" ] && echo "$files" | xargs nvim
}
