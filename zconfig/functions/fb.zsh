# fb - checkout git branch
fb() {
  git rev-parse --is-inside-work-tree &>/dev/null || { echo "Not a git repository"; return 1; }
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}
