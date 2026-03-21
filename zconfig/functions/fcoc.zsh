# fcoc - checkout git commit
fcoc() {
  git rev-parse --is-inside-work-tree &>/dev/null || { echo "Not a git repository"; return 1; }
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}
