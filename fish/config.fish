if status is-interactive
  # thefuck --alias | source

	alias g="git"
	alias v="nvim"
	alias vim="nvim"
	alias vi="nvim"
	# alias vide="neovide"
	alias ll "exa -l -g --icons"
	alias lla "ll -a"

	set -gx PATH "$HOME/.cargo/bin" $PATH;
	set -gx PATH "$HOME/.local/bin" $PATH;
	set -gx PATH "$HOME/.bun/bin" $PATH;

	function tre
		command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null
	end

	# set --universal ayu_variant dark && ayu_load_theme
	starship init fish | source
	#source ~/.config/fish/themes/moonfly.fish
	#fish_config theme choose 'fish default'
end

# bun
set -Ux BUN_INSTALL "/home/lloyd/.bun"
fish_add_path "/home/lloyd/.bun/bin"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set -U fish_color_autosuggestion      brblack
set -U fish_color_cancel              -r
set -U fish_color_command             brgreen
set -U fish_color_comment             brmagenta
set -U fish_color_cwd                 green
set -U fish_color_cwd_root            red
set -U fish_color_end                 brmagenta
set -U fish_color_error               brred
set -U fish_color_escape              brcyan
set -U fish_color_history_current     --bold
set -U fish_color_host                normal
set -U fish_color_match               --background=brblue
set -U fish_color_normal              normal
set -U fish_color_operator            cyan
set -U fish_color_param               brblue
set -U fish_color_quote               yellow
set -U fish_color_redirection         bryellow
set -U fish_color_search_match        'bryellow' '--background=brblack'
set -U fish_color_selection           'white' '--bold' '--background=brblack'
set -U fish_color_status              red
set -U fish_color_user                brgreen
set -U fish_color_valid_path          --underline
set -U fish_pager_color_completion    normal
set -U fish_pager_color_description   yellow
set -U fish_pager_color_prefix        'white' '--bold' '--underline'
set -U fish_pager_color_progress      'brwhite' '--background=cyan'
