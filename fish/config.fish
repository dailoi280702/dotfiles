if status is-interactive
  thefuck --alias | source

	alias g="git"
	alias v="nvim"
	alias vim="nvim"
	alias vi="nvim"
	alias vide="neovide"
	alias ll "exa -l -g --icons"
	alias lla "ll -a"

	set -gx PATH "$HOME/.cargo/bin" $PATH;
	set -gx PATH "$HOME/.local/bin" $PATH;

	function tre
		command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null
	end

	# set --universal ayu_variant dark && ayu_load_theme
	starship init fish | source
	source ~/.config/fish/themes/kanagawa.fish
end
