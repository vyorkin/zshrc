# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  git rev-parse --is-inside-work-tree &>/dev/null || { echo "Not a git repository"; return 1; }
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}
