# Vscode color palette with Catppuccin style

# --> special
set -l foreground b2b2b2
set -l selection b2ceee

# --> palette
set -l teal 79dac8
set -l flamingo ff5189
set -l mauve 80a0ff
set -l pink d18ce8
set -l red ff5454
set -l peach d16969
set -l green 36c692
set -l yellow c2c292
set -l blue 74b2ff
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

