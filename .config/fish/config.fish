set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;
set -gx GOROOT $(go env GOROOT)
set -gx GOPATH $(go env GOPATH)
set -gx GOBIN $(go env GOPATH)/bin
set -gx PATH $PATH $GOBIN $GOPATH $GOROOT;

# Only run this in interactive shells
if status is-interactive
    fish_vi_key_bindings
    set -gx EDITOR nvim

    # aliases
    abbr g "git"
    abbr v "nvim"
    abbr vim "nvim"
    abbr vi "nvim"
    abbr tf "terraform"
    abbr lg "lazygit"
    alias ll "eza -l -g --icons"
    alias lla "ll -a"

    # cursor style
    set fish_cursor_default     block      blink
    set fish_cursor_insert      line       blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block

    fish_config theme choose 'fish default'

    if command -q starship 
        starship init fish | source
    end


    if command -q zoxide
        zoxide init fish | source
    end

    thefuck --alias | source
end
