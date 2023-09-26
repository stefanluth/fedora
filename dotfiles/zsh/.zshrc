export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="muse"
RPROMPT="[%D{%y/%m/%f}|%@]"

plugins=(
    dnf
    git
    gh
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias \$=''
alias zshconfig="code $HOME/.zshrc"
alias ls='ls -lah --color=auto'
alias dcdbu="docker-compose down && docker-compose build && docker-compose up"
alias dcdu="docker-compose down && docker-compose up"

# Functions

# Convert input string GitHub repository URL from HTTPS to SSH
# e.g. from "https://github.com/foo/bar" to "git@github.com:foo/bar.git"
function gh-ssh() {
    if [[ $1 == "" ]]; then
        echo "Usage: gh-ssh <repo-url>"
        return 1
    fi

    GH_URL=$(echo $1 | sed -e 's/https:\/\/github.com/git@github.com:/' | sed -e 's/\.git//')

    # if xclip is installed, copy the result to clipboard, otherwise just print it
    if command -v xclip &> /dev/null; then
        echo $GH_URL | xclip -selection clipboard
    else
        echo $GH_URL
    fi
}

eval $(thefuck --alias)
