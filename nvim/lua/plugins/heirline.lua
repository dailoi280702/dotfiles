local M = {
	"rebelot/heirline.nvim",
	event = "VeryLazy",
}

function M.config()
	local conditions = require("heirline.conditions")
	local utils = require("heirline.utils")

	local TerminalName = {
		provider = function()
			local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
			return " " .. tname
		end,
		hl = { fg = "blue", bold = true },
	}

	local HelpFileName = {
		condition = function()
			return vim.bo.filetype == "help"
		end,
		provider = function()
			local filename = vim.api.nvim_buf_get_name(0)
			return vim.fn.fnamemodify(filename, ":t")
		end,
		hl = { fg = "blue" },
	}

	local FileType = {
		provider = function()
			return string.upper(vim.bo.filetype)
		end,
		hl = { fg = utils.get_highlight("Type").fg, bold = true },
	}

	local SearchCount = {
		condition = function()
			return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
		end,
		init = function(self)
			local ok, search = pcall(vim.fn.searchcount)
			if ok and search.total then
				self.search = search
			end
		end,
		provider = function(self)
			local search = self.search
			return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
		end,
	}

	local FileNameBlock = {
		init = function(self)
			self.filename = vim.api.nvim_buf_get_name(0)
		end,
	}

	local FileIcon = {
		init = function(self)
			local filename = self.filename
			local extension = vim.fn.fnamemodify(filename, ":e")
			self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
		end,
		provider = function(self)
			return self.icon and (" " .. self.icon)
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end,
	}

	local FileName = {
		provider = function(self)
			local filename = vim.fn.fnamemodify(self.filename, ":.")
			if filename == "" then
				return "[No Name]"
			end
			if not conditions.width_percent_below(#filename, 0.25) then
				filename = vim.fn.pathshorten(filename)
			end
			return (" " .. filename)
		end,
		hl = { fg = utils.get_highlight("Directory").fg },
	}

	local FileFlags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = "[+]",
			hl = { fg = "green" },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = "",
			hl = { fg = "orange" },
		},
	}

	local FileNameModifer = {
		hl = function()
			if vim.bo.modified then
				-- use `force` because we need to override the child's hl foreground
				return { fg = "cyan", bold = true, force = true }
			end
		end,
	}

	FileNameBlock = utils.insert(
		FileNameBlock,
		utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
		FileFlags,
		FileIcon,
		{ provider = "%<" } -- this means that the statusline is cut here when there's not enough space
	)

	local Git = {
		condition = conditions.is_git_repo,

		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
		end,

		-- hl = { fg = "orange" },
		hl = { fg = "purple" },

		{ -- git branch name
			provider = function(self)
				return "  " .. self.status_dict.head
			end,
			hl = { bold = true },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = "(",
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ("+" .. count)
			end,
			hl = { fg = "git_add" },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ("-" .. count)
			end,
			hl = { fg = "git_del" },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ("~" .. count)
			end,
			hl = { fg = "git_change" },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = ")",
		},
	}

	local Diagnostics = {

		condition = conditions.has_diagnostics,

		static = {
			error_icon = " ",
			warn_icon = " ",
			info_icon = " ",
			hint_icon = " ",
		},

		init = function(self)
			self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
			self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
			self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		end,

		update = { "DiagnosticChanged", "BufEnter" },

		{
			provider = " ",
		},
		{
			provider = function(self)
				-- 0 is just another output, we can decide to print it or not!
				return self.errors > 0 and (self.error_icon .. self.errors .. " ")
			end,
			hl = { fg = "diag_error" },
		},
		{
			provider = function(self)
				return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
			end,
			hl = { fg = "diag_warn" },
		},
		{
			provider = function(self)
				return self.info > 0 and (self.info_icon .. self.info .. " ")
			end,
			hl = { fg = "diag_info" },
		},
		{
			provider = function(self)
				return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
			end,
			hl = { fg = "diag_hint" },
		},
	}

	local Ruler = {
		provider = "%7(%l/%L%):%c %P",
	}

	local ScrollBar = {
		static = {
			sbar = {
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
				" ",
			},
		},
		provider = function(self)
			local curr_line = vim.api.nvim_win_get_cursor(0)[1]
			local lines = vim.api.nvim_buf_line_count(0)
			local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
			return string.rep(self.sbar[i], 1)
		end,
		hl = { fg = "blue" },
	}

	local ViMode = {
		init = function(self)
			self.mode = vim.fn.mode(1) -- :h mode()
			if not self.once then
				vim.api.nvim_create_autocmd("ModeChanged", {
					pattern = "*:*o",
					command = "redrawstatus",
				})
				self.once = true
			end
		end,
		static = {
			mode_names = { -- change the strings if you like it vvvvverbose!
				n = "N",
				no = "N?",
				nov = "N?",
				noV = "N?",
				["no\22"] = "N?",
				niI = "Ni",
				niR = "Nr",
				niV = "Nv",
				nt = "Nt",
				v = "V",
				vs = "Vs",
				V = "V_",
				Vs = "Vs",
				["\22"] = "^V",
				["\22s"] = "^V",
				s = "S",
				S = "S_",
				["\19"] = "^S",
				i = "I",
				ic = "Ic",
				ix = "Ix",
				R = "R",
				Rc = "Rc",
				Rx = "Rx",
				Rv = "Rv",
				Rvc = "Rv",
				Rvx = "Rv",
				c = "C",
				cv = "Ex",
				r = "...",
				rm = "M",
				["r?"] = "?",
				["!"] = "!",
				t = "T",
			},
			mode_colors = {
				n = "red",
				i = "green",
				v = "cyan",
				V = "cyan",
				["\22"] = "cyan",
				c = "purple",
				s = "orange",
				S = "orange",
				["\19"] = "orange",
				R = "purple",
				r = "purple",
				["!"] = "red",
				t = "red",
			},

			mode_icons = {
				n = "履",
				i = "פֿ ",
				v = " ",
				V = " ",
				["\22"] = " ",
				c = " ",
				s = " ",
				S = " ",
				["\19"] = " ",
				R = " ",
				r = " ",
				["!"] = " ",
				t = " ",
			},
		},

		provider = function(self)
			-- return "  %2(" .. self.mode_names[self.mode] .. "%) "
			return " " .. self.mode_icons[self.mode:sub(1, 1)] .. "%)%2(" .. self.mode_names[self.mode] .. "%) "
		end,

		hl = function(self)
			local mode = self.mode:sub(1, 1) -- get only the first mode character
			return { fg = self.mode_colors[mode], bold = true }
		end,

		update = {
			"ModeChanged",
		},
	}

	local colors = {
		bright_bg = "#262626",
		bright_fg = "#525252",
		red = "#ff7eb6",
		dark_red = "#ee5396",
		green = "#42be65",
		blue = "#82cfff",
		gray = "#525252",
		orange = "",
		purple = "#be95ff",
		cyan = "#3ddbd9",
		diag_warn = "#3ddbd9",
		diag_error = "#ee5396",
		diag_hint = "#78a9ff",
		diag_info = "#dde1e6",
		git_del = "#ee5396",
		git_add = "#08bdba",
		git_change = "#78a9ff",
		comment = "#525252",
	}
	require("heirline").load_colors(colors)

	local Space = { provider = " " }
	local Align = { provider = "%=" }
	local Break = { provider = "%<" }

	local DefaultStatusline = {
		ViMode,
		Git,
		Space,
		Diagnostics,
		FileNameBlock,
		Break,
		Align,
		SearchCount,
		Ruler,
		Space,
		ScrollBar,
	}

	local InactiveStatusline = {
		hl = { fg = "comment", force = true },
		condition = conditions.is_not_active,
		FileNameBlock,
		Align,
		Ruler,
		Space,
	}

	local TerminalStatusline = {

		condition = function()
			return conditions.buffer_matches({ buftype = { "terminal" } })
		end,

		{ condition = conditions.is_active, ViMode, Space },
		FileType,
		Space,
		TerminalName,
		Align,
	}

	local SpecialStatusline = {
		condition = function()
			return conditions.buffer_matches({
				buftype = { "nofile", "prompt", "help", "quickfix" },
				filetype = { "^git.*", "fugitive" },
			})
		end,

		hl = { bg = "bright_bg" },

		Space,
		FileType,
		Space,
		HelpFileName,
		Align,
		SearchCount,
		Ruler,
		Space,
		ScrollBar,
	}

	local StatusLines = {
		hl = function()
			if conditions.is_active() then
				return "StatusLine"
			else
				return "StatusLineNC"
			end
		end,

		fallthrough = false,

		SpecialStatusline,
		TerminalStatusline,
		InactiveStatusline,
		DefaultStatusline,
	}

	require("heirline").setup({
		statusline = StatusLines,
	})
end

return M
