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

eval $(thefuck --alias)
alias \$=''
alias zshconfig="code $HOME/.zshrc"
alias ls='ls -lah --color=auto'
alias dcdbu="docker-compose down && docker-compose build && docker-compose up"
alias dcdu="docker-compose down && docker-compose up"
alias untar='tar -xvf'
alias openconflicts='git status --porcelain | grep '^UU' | cut -c 4- | xargs code'
