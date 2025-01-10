tput cup 9999 0
echo '        A B A B  '
# echo "Only suckers put hope in the future."
# echo "I have to be successful, \033[1mbecause I like expensive shit.\033[0m"
# echo "Why where we born, when will we die?"
# echo "I guess we never know. \033[1mKeep coding.\033[0m"


eval "$(starship init zsh)"
export NVM_LAZY_LOAD=false
export NVM_COMPLETION=false

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "jeffreytse/zsh-vi-mode"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-rust"
plug "wintermi/zsh-brew"
plug "zap-zsh/completions"
plug "lukechilds/zsh-nvm"

# Load and initialise completion system
autoload -Uz compinit
compinit

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export GOBIN=$(go env GOPATH)/bin
# export PATH=$HOME/.local/share/nvim/mason/packages:$PATH
# export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin
# export DOCKER_CONFIG=$HOME/newdir/.docker
export PATH="/Users/loi/Library/Python/3.9/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export EDITOR=nvim
export GOPRIVATE=gitlab.com/husol*

alias -g g="git"
alias -g tf="terraform"
alias -g vim="vi"
alias -g vi="nvim"
alias -g ll="eza -l -g --icons"
alias -g lla="ll -a"

# function load_nvm() {
#     export NVM_DIR="$HOME/.nvm"
#     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# }

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lloyd/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lloyd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lloyd/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lloyd/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# preexec() {
#     clear
# }

# precmd () {
#     printf '\033[38;5;244m%*s\033[0m\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
#     tput cup 9999 0
#     tput el
# }

if command -v zoxide; then
    eval "$(zoxide init zsh)"
fi
