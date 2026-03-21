# fbr - checkout git branch (including remote branches)
fbr() {
  git rev-parse --is-inside-work-tree &>/dev/null || { echo "Not a git repository"; return 1; }
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
