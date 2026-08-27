set -o vi
export EDITOR=nvim
export GOPRIVATE="gitlab.com/husol*"

alias vi="nvim"
alias ll="eza -l -g --icons=always"
alias lla="ll -a"

zsh_plugins_dir="$HOME/.zsh"
autosuggestions="$zsh_plugins_dir/zsh-autosuggestions"
syntax_highlighting="$zsh_plugins_dir/zsh-syntax-highlighting"

[ ! -d "$autosuggestions" ] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$autosuggestions"
[ ! -d "$syntax_highlighting" ] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$syntax_highlighting"

autoload -Uz compinit
compinit

[ -f "$autosuggestions/zsh-autosuggestions.zsh" ] && source "$autosuggestions/zsh-autosuggestions.zsh"

command -v mise >/dev/null 2>&1 && eval "$(mise activate zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

[ -f "$syntax_highlighting/zsh-syntax-highlighting.zsh" ] && source "$syntax_highlighting/zsh-syntax-highlighting.zsh"
