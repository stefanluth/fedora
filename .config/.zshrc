export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="muse"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

plugins=(
    dnf
    git
    gh
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)

# zsh
alias zshconfig="code $HOME/.zshrc"
alias zshreload="source $HOME/.zshrc"

# General
alias \$=""
alias ls="ls -lah --color=auto"
alias untar="tar -xvf"

# Git
alias git-undo="git reset --soft HEAD~1"
alias git-conflicts="git status --porcelain | grep '^UU' | cut -c 4- | xargs code"
alias git-add-new="git status --porcelain | grep '^??' | cut -c 4- | xargs git add"
alias git-add-old="git status --porcelain | grep '^ D' | cut -c 4- | xargs git add"
alias git-add-mod="git status --porcelain | grep '^ M' | cut -c 4- | xargs git add"
alias git-pce="git_pce"
alias git-squash="git_squash"

git_pce() {
  git checkout -b "feature/PCE-$1_$2"
}

git_squash() {
  if [ $# -lt 2 ]; then
    echo "Usage: git_squash <number_of_commits> <commit_message>"
    return 1
  fi

  local commit_count=$1
  shift
  local commit_message="$*"

  # Ensure the number of commits is a number and not less than 1
  if ! [[ "$commit_count" =~ ^[0-9]+$ ]] || [ "$commit_count" -lt 1 ]; then
    echo "The number of commits to squash must be a positive integer."
    return 1
  fi

  # Perform the soft reset and commit with the provided message
  git reset --soft HEAD~"$commit_count" &&
  git commit -m "$commit_message"
}

# Docker
alias dockerc-du="docker-compose down && docker-compose up"
alias dockerc-dbu="docker-compose down && docker-compose build && docker-compose up"
alias docker-rmf='docker_rmf'
alias docker-rmif='docker_rmif'

docker_rmf() {
  docker rm -f $(docker ps -a | grep "$1" | awk '{print $1}')
}

docker_rmif() {
  docker rmi -f $(docker images | grep "$1" | awk '{print $3}')
}

# Tmux
alias ta="tmux attach"
alias td="tmux detach"
alias tr="tmux source-file ~/.tmux.conf && tmux attach" # for reloading sessions with tmux-resurrect
alias tns="tmux new-session -s"

# Utility functions

# Run command in background, without output
b() {
  nohup "$@" > /dev/null 2>&1 &
  disown
}

# Update all package-lock.json files in the current git repository
update_packages() {
  local parallel_mode=false
  if [[ "$1" == "--parallel" ]]; then
    parallel_mode=true
  fi

  local files=$(git status --porcelain | grep 'package-lock.json' | awk '{print $2}')
  for file in $files; do
    rm "$file"

    local dir=$(dirname "$file")
    if [[ "$parallel_mode" == true ]]; then
      (cd "$dir" && npm install &)
    else
      (cd "$dir" && npm install)
    fi
  done

  if [[ "$parallel_mode" == true ]]; then
    wait
  fi
}
