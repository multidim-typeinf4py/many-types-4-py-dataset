# ./reset_commits.sh [spec file] [repos dir]

while IFS= read -r line; do
  split=($line)
  url=${split[0]}
  commit=${split[1]}

  author=$(basename $(dirname $url))
  repo=$(basename $url .git)

  if [[ -d "$2/$author/$repo" ]]; then
    echo "$2/$author/$repo" 
    cd "$2/$author/$repo"
    git reset --hard $commit
    cd - > /dev/null
  else
    echo "Skipping $2/$author/$repo; folder does not exist"
  fi
done <"$1"
