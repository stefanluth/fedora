export ZSH=" $HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(
    dnf
    git
    gh
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias zshconfig="code $HOME/.zshrc"
alias \$=''
eval $(thefuck --alias)
