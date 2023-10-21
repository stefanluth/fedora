export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="muse"

plugins=(
    dnf
    git
    gh
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias zshconfig="code $HOME/.zshrc"
eval $(thefuck --alias)

# General
alias \$=''
alias ls='ls -lah --color=auto'
alias untar='tar -xvf'

# Git
alias openconflicts='git status --porcelain | grep '^UU' | cut -c 4- | xargs code'

# Docker
alias dcdu="docker-compose down && docker-compose up"
alias dcdbu="docker-compose down && docker-compose build && docker-compose up"

# Tmux
alias ta="tmux attach"
alias tns="tmux new-session -s"
