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

	starship init fish | source

# Vscode color palette with Catppuccin style

# --> special
	set -l foreground 9cdcfe
	set -l selection 313244

# --> palette
	set -l teal 4ec9b0
	set -l flamingo ce9178
	set -l mauve 646695
	set -l pink c586c0
	set -l red f44747
	set -l peach d16969
	set -l green 608b4e
	set -l yellow dcdcaa
	set -l blue 569cd6
	set -l gray 808080

# Syntax Highlighting
	set -g fish_color_normal $foreground
	set -g fish_color_command $blue
	set -g fish_color_param $flamingo
	set -g fish_color_keyword $red
	set -g fish_color_quote $green
	set -g fish_color_redirection $pink
	set -g fish_color_end $peach
	set -g fish_color_error $red
	set -g fish_color_gray $gray
	set -g fish_color_selection --background=$selection
	set -g fish_color_search_match --background=$selection
	set -g fish_color_operator $pink
	set -g fish_color_escape $flamingo
	set -g fish_color_autosuggestion $gray
	set -g fish_color_cancel $red

# Prompt
	set -g fish_color_cwd $yellow
	set -g fish_color_user $teal
	set -g fish_color_host $blue

# Completion Pager
	set -g fish_pager_color_progress $gray
	set -g fish_pager_color_prefix $pink
	set -g fish_pager_color_completion $foreground
	set -g fish_pager_color_description $gray
end
