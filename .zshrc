eval "$(starship init zsh)"
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

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
plug "agkozak/zsh-z"

# Load and initialise completion system
autoload -Uz compinit
compinit

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export DOCKER_CONFIG=$HOME/newdir/.docker
export PATH="/Users/loi/Library/Python/3.9/bin:$PATH"
export EDITOR=nvim

alias -g g="git"
alias -g v="nvim"
alias -g vim="nvim"
alias -g vi="nvim"
alias -g e="nice -n -19 nvim"
alias -g ll="exa -l -g --icons"
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
