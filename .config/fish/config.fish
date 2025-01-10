fish_config theme choose 'fish default'

if command -q starship 
    starship init fish | source
end

# aliases
alias g="git"
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias ll "eza -l -g --icons"
alias lla "ll -a"

set -gx EDITOR nvim

set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;

# Go
set -gx GOBIN "$(go env GOPATH)/bin"
set -gx PATH $GOBIN $PATH;

# if status is-interactive
# end

fish_vi_key_bindings

if command -q zoxide
    zoxide init fish | source
end

thefuck --alias | source
