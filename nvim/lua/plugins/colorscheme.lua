local M = {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
}

M.config = function()
	local theme = require("rose-pine")
	theme.setup({
		disable_background = true,
		disable_italics = true,
	})

	-- vim.cmd.colorscheme("rose-pine")
	vim.cmd.colorscheme("retrobox")

	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#b8bb26" })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8ec07c" })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#fb4934" })
	vim.api.nvim_set_hl(0, "HopNextKey", { fg = "#d3869b", bold = true })
	vim.api.nvim_set_hl(0, "HopNextKey1", { fg = "#83a598", bold = true })
	vim.api.nvim_set_hl(0, "HopNextKey2", { fg = "#8ec07c" })
end

return M

-- " Color: neutralred              #cc241d        160            DarkRed
-- " Color: neutralgreen            #98971a        100            DarkGreen
-- " Color: neutralyellow           #d79921        172            DarkYellow
-- " Color: neutralblue             #458588        66             DarkBlue
-- " Color: neutralpurple           #b16286        132            DarkMagenta
-- " Color: neutralaqua             #689d6a        71             DarkCyan
-- " Color: neutralorange           #d65d0e        166            LightRed
-- " Background: dark
-- " Color: bg0                     #1c1c1c        234            Black
-- " Color: bg1                     #3c3836        237            DarkGray
-- " Color: bg2                     #504945        239            DarkGray
-- " Color: bg3                     #303030        236
-- " Color: bg4                     #7c6f64        243
-- " Color: bg5                     #000000        16             DarkGray
-- " Color: bg6                     #121212        233            DarkGray
-- " Color: fg0                     #fbf1c7        230            White
-- " Color: fg1                     #ebdbb2        187            White
-- " Color: fg2                     #d5c4a1        187
-- " Color: fg3                     #bdae93        144
-- " Color: fg4                     #a89984        102            gray
-- " Color: grey                    #928374        102            DarkGray
-- " Color: red                     #fb4934        203            Red
-- " Color: green                   #b8bb26        142            Green
-- " Color: yellow                  #fabd2f        214            Yellow
-- " Color: blue                    #83a598        109            Blue
-- " Color: purple                  #d3869b        175            Magenta
-- " Color: aqua                    #8ec07c        107            Cyan
-- " Color: orange                  #fe8019        208            Magenta