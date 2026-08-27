--: Options
vim.g.mapleader = " "
vim.cmd.colorscheme("default")
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.ignorecase = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.termguicolors = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.wrap = false
opt.nu = true
opt.rnu = true
opt.background = "dark"

vim.filetype.add({ extension = { tf = "terraform", tfstate = "terraform" } })

vim.diagnostic.config({
	virtual_text = {
		virt_text_pos = "eol",
	},
	underline = true,
})
--:

--: Basic keymaps
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>tc", "<cmd>ColorizerToggle<cr>", { desc = "Toggle Colorizer" })
--:

--: Colorscheme
vim.pack.add({
	"https://github.com/nickkadutskyi/jb.nvim",
	"https://github.com/ember-theme/nvim",
	"https://github.com/vague-theme/vague.nvim",
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*,retrobox",
	callback = function()
		vim.api.nvim_set_hl(0, "Identifier", { link = "Text", force = true })
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*",
	callback = function()
		vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e27" })
		vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = "#1e1e27" })
	end,
})

require("catppuccin").setup({
	flavour = "auto",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true,
	float = {
		transparent = true,
		solid = true,
	},
	no_italic = true,
	default_integrations = true,
	auto_integrations = true,
})

vim.cmd.colorscheme("catppuccin-nvim")
--:

--: Arborist
vim.pack.add({ "https://github.com/arborist-ts/arborist.nvim" })
require("arborist").setup({})
--:

--: FzfLua
vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
	winopts = {
		treesitter = { enabled = false },
	},
	previewers = {
		builtin = {
			treesitter = { enabled = false },
		},
	},
})

vim.keymap.set("n", "<leader>.", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader><tab>", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>'", "<cmd>FzfLua resume<cr>", { desc = "Resume search" })
--:

--: Statusline & Mini Icons
vim.pack.add({
	"https://github.com/nvim-mini/mini.statusline",
	"https://github.com/nvim-mini/mini.icons",
})

require("mini.statusline").setup()
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
--:

--: Oil
vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	view_options = { show_hidden = true },
	default_file_explorer = true,
})

vim.keymap.set("n", "<leader>,", "<cmd>Oil<cr>", { desc = "Browse files" })
--:

--: Gitsigns & Guard
vim.pack.add({
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvimdev/guard-collection",
	"https://github.com/nvimdev/guard.nvim",
})

local gs = require("gitsigns")
gs.setup({ current_line_blame = true })
vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })

local ft = require("guard.filetype")
ft("python"):fmt("black")
ft("lua"):fmt("stylua")
ft("go"):fmt({ cmd = "gofumpt", stdin = true, args = {} })
ft(
	"javascript,javascriptreact,typescript,typescriptreact,vue,css,scss,less,html,json,jsonc,yaml,markdown,markdown.mdx,graphql,handlebars"
):fmt("prettier")
ft("rust"):fmt("rustfmt")
ft("*"):lint("codespell")

vim.g.guard_config = {
	fmt_on_save = true,
	lsp_as_default_formatter = true,
	auto_lint = true,
	lint_interval = 300,
	refresh_diagnostic = true,
}
--:

--: LSP Config (Top-level setup; native PATH lookup)
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/saghen/blink.lib",
	"https://github.com/saghen/blink.cmp",
})

vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Goto Definition" })
vim.keymap.set("n", "grD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "Goto Declaration" })
vim.keymap.set("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "References" })
vim.keymap.set("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "Goto Implementation" })

local server_opts = {
	ts_ls = {},
	cssls = {},
	html = { filetypes = { "html", "php", "rust", "typescriptreact", "javascriptreact" } },
	ltex = {},
	gopls = {},
	sqlls = {},
	bashls = {},
	pyright = {},
	zls = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				diagnostics = { globals = { "vim", "require" } },
				workspace = {
					library = {
						vim.fn.expand("~/.config/hammerspoon/Spoons/EmmyLua.spoon/annotations"),
					},
				},
				telemetry = { enable = false },
			},
		},
	},
	buf_ls = {},
	golangci_lint_ls = {},
	eslint = {},
	rust_analyzer = {},
	terraformls = {},
	typos_lsp = {},
}

if vim.fn.executable("nix") == 1 then
	server_opts.nil_ls = {
		settings = {
			["nil"] = { formatting = { command = { "nixfmt" } } },
		},
	}
end

local blink_ok, blink = pcall(require, "blink.cmp")
local blink_caps = blink_ok and blink.get_lsp_capabilities({}, false) or {}

local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink_caps, {
	textDocument = {
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
	},
})

for server_name, opts in pairs(server_opts) do
	vim.lsp.config(server_name, vim.tbl_deep_extend("force", { capabilities = capabilities }, opts or {}))
end
--:

--: Idle / Non-critical Utilities (Deferred via vim.schedule)
vim.schedule(function()
	vim.pack.add({
		"https://github.com/NvChad/nvim-colorizer.lua",
		"https://github.com/nvim-mini/mini.misc",
		"https://github.com/nvim-mini/mini.cursorword",
		"https://github.com/lukas-reineke/indent-blankline.nvim",
		"https://github.com/nvim-mini/mini.ai",
		"https://github.com/nvim-mini/mini.comment",
		"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	})

	require("colorizer").setup()
	require("mini.misc").setup({ make_global = { "put", "put_text", "setup_termbg_sync", "zoom" } })
	require("mini.cursorword").setup({})
	require("ibl").setup({ indent = { char = "│" }, scope = { enabled = false } })

	require("mini.ai").setup({})
	require("ts_context_commentstring").setup({ enable_autocmd = false })
	require("mini.comment").setup({
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
	})
end)
--:

--: Blink Completion (Deferred to Insert mode typing)
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/rafamadriz/friendly-snippets",
			{ src = "https://github.com/saghen/blink.lib" },
			{ src = "https://github.com/saghen/blink.cmp" },
		})


		local blink_cmp = require("blink.cmp")

		blink_cmp.build():pwait()
		blink_cmp.setup({
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = { enabled = true },
			completion = {
				list = {
					selection = {
						auto_insert = true,
						preselect = function(ctx)
							return ctx.mode ~= "cmdline" and not blink_cmp.snippet_active({ direction = 1 })
						end,
					},
				},
				documentation = { auto_show = true, auto_show_delay_ms = 100 },
				ghost_text = { enabled = true },
			},
			keymap = {
				["<Tab>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
		})
	end,
})
--:

--: UFO Folding
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/kevinhwang91/promise-async",
			"https://github.com/kevinhwang91/nvim-ufo",
		})

		local ufo = require("ufo")

		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ok, _ = pcall(require, "tree-sitter")
		if ok then
			ufo.setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
			})
		else
			ufo.setup()
		end

		vim.keymap.set("n", "z,", "<cmd>%foldclose<CR>", { desc = "Close first level folds" })
		vim.keymap.set("n", "z.", "<cmd>sil! normal mzzM`zzO<CR>", { desc = "Magic fold" })
		vim.keymap.set("n", "zM", ufo.closeAllFolds)
		vim.keymap.set("n", "zR", ufo.openAllFolds)
	end,
})
--:
