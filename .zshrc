set -o vi
export GOPRIVATE="gitlab.com/husol*"

(( $+commands[nvim] )) && { alias vi="nvim"; export EDITOR=nvim; }
(( $+commands[eza] ))  && { alias ll="eza -l -g --icons=always"; alias tree="eza --tree --icons=always"; alias lla="ll -a"; }
(( $+commands[lsd] ))  && alias ls="lsd"

zsh_plugins_dir="$HOME/.zsh"
autosuggestions="$zsh_plugins_dir/zsh-autosuggestions"
syntax_highlighting="$zsh_plugins_dir/zsh-syntax-highlighting"

[[ ! -d "$autosuggestions" ]] && git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$autosuggestions"
[[ ! -d "$syntax_highlighting" ]] && git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting "$syntax_highlighting"

autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m+1) ]]; then
    compinit
else
    compinit -C
fi

[[ -f "$autosuggestions/zsh-autosuggestions.zsh" ]] && source "$autosuggestions/zsh-autosuggestions.zsh"

(( $+commands[mise]   )) && eval "$(mise activate zsh)"
(( $+commands[zoxide] )) && eval "$(zoxide init zsh)"
(( $+commands[fzf]    )) && eval "$(fzf --zsh)"
(( $+commands[starship] )) && {
    [[ -z $__starship_initialized ]] && export __starship_initialized=1
    eval "$(starship init zsh)"
}

[[ -f "$syntax_highlighting/zsh-syntax-highlighting.zsh" ]] && source "$syntax_highlighting/zsh-syntax-highlighting.zsh"
