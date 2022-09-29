if status is-interactive
  thefuck --alias | source

	alias g="git"
	alias v="nvim"
	alias vim="nvim"
	alias vi="nvim"
	alias ls="ll"
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

function quickgit # This is the function name and command we call
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git push # Push to remote
end
