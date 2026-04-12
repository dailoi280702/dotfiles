--: Opptions
vim.g.mapleader = " "
vim.cmd.colorscheme("default")
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }
vim.opt.autowrite = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:1" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.background = "dark"

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

--: colorscheme
vim.pack.add({
	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/ember-theme/nvim",
})
--
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "catppuccin*,retrobox",
	callback = function()
		vim.api.nvim_set_hl(0, "Identifier", { link = "Text", force = true })
	end,
})

vim.cmd.colorscheme("ember")
--:

--: Tree-sitter
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

local ts = require("nvim-treesitter")

ts.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local supported_languages = {}
		for _, lang in ipairs(ts.get_available()) do
			supported_languages[lang] = true
		end

		local ft = vim.bo[args.buf].filetype

		if not supported_languages[ft] then
			return
		end

		if not pcall(vim.treesitter.start) then
			ts.install(ft)
		end
	end,
})
--:

--: Oil
vim.schedule(function()
	vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

	require("oil").setup({
		view_options = {
			show_hidden = true,
		},
		default_file_explorer = true,
	})

	vim.keymap.set("n", "<leader>,", "<cmd>Oil<cr>", { desc = "Brow files" })
end)
--

--: FzfLua
vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
	winopts = {
		treesitter = {
			enabled = false,
		},
	},
	previewers = {
		builtin = {
			treesitter = {
				enabled = false,
			},
		},
	},
})

vim.keymap.set("n", "<leader>.", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader><tab>", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>'", "<cmd>FzfLua resume<cr>", { desc = "Resume search" })
--:

--: Status line
vim.pack.add({ "https://github.com/nvim-mini/mini.statusline" })

require("mini.statusline").setup()
--:

--: Blink
-- TODO: auto build fuzzy search
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/rafamadriz/friendly-snippets",
			{
				src = "https://github.com/saghen/blink.cmp",
				version = vim.version.range("^1"),
			},
		})

		require("blink.cmp").setup({
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {},
			},
			fuzzy = {
				implementation = "prefer_rust",
				prebuilt_binaries = {
					download = true,
					force_version = "v1.10.1",
				},
			},
			signature = {
				enabled = true,
			},
			completion = {
				list = {
					selection = {
						auto_insert = true,
						preselect = function(ctx)
							return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
						end,
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 100,
				},
				ghost_text = {
					enabled = true,
				},
			},
			keymap = {
				["<CR>"] = {
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
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
		})
	end,
})
--:

-- : utilities
vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

vim.schedule(function()
	vim.pack.add({
		"https://github.com/nvim-mini/mini.icons",
		"https://github.com/NvChad/nvim-colorizer.lua",
		"https://github.com/nvim-mini/mini.misc",
		"https://github.com/nvim-mini/mini.cursorword",
		"https://github.com/lukas-reineke/indent-blankline.nvim",
	})

	require("colorizer").setup()
	require("mini.misc").setup({
		make_global = {
			"put",
			"put_text",
			"setup_termbg_sync",
			"zoom",
		},
	})
	require("mini.cursorword").setup({})
	require("ibl").setup({
		indent = { char = "│" },
		scope = { enabled = false },
	})
end)
--:

--: Fold
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
		vim.keymap.set("n", "z.", "<cmd>sil! normal mzzM`zzO<CR>", { desc = "Magic fold  " })
		vim.keymap.set("n", "zM", ufo.closeAllFolds)
		vim.keymap.set("n", "zR", ufo.openAllFolds)
	end,
})
--:

--: Gitsigns
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

		local gs = require("gitsigns")

		gs.setup({
			current_line_blame = true,
		})

		vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
		vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })
	end,
})
--:

--: Guard
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/nvimdev/guard-collection",
			"https://github.com/nvimdev/guard.nvim",
		})

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
	end,
})
--:

--: Mason
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile"}, {
-- 	once = true,
-- 	callback = function()
vim.pack.add({ "https://github.com/mason-org/mason.nvim" })

local tools = {
	"stylua",
	"shfmt",
	"prettierd",
	"stylua",
	"golangci-lint",
	"gofumpt",
	"eslint_d",
	"fixjson",
	"black",
	"rust-analyzer",
}

require("mason").setup({
	ensure_installed = tools,
})

local mr = require("mason-registry")

local function mason_install()
	for _, tool in ipairs(tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

if mr.refresh then
	mr.refresh(mason_install)
else
	mason_install()
end
-- 	end,
-- })
--:

--: Lsp
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePre" }, {
-- 	once = true,
-- 	callback = function()
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/saghen/blink.cmp",
})

vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "Goto Definition" })
vim.keymap.set("n", "grD", "<cmd>FzfLua lsp_declarations<cr>", { desc = "Goto Declaration" })
vim.keymap.set("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "References" })
vim.keymap.set("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "Goto Implementation" })

local server_opts = {
	ts_ls = {},
	cssls = {},
	html = { filetypes = { "html", "php", "rust", "typesciptreact", "javascriptreact" } },
	ltex = {},
	tailwindcss = {},
	gopls = {},
	sqlls = {},
	bashls = {},
	pyright = {},
	-- intelephense = {},
	zls = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = {
						"vim",
						"require",
					},
				},
				workspace = {
					-- library = vim.api.nvim_get_runtime_file("", true),
					library = {
						vim.fn.expand("~/.config/hammerspoon/Spoons/EmmyLua.spoon/annotations"),
					},
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
	buf_ls = {},
	golangci_lint_ls = {
		-- command = { "golangci-lint", "run", "--output.json.path=stdout", "--show-stats=false" },
	},
	eslint = {},
	rust_analyzer = {},
	terraformls = {
		-- filetypes = { "terraform", "terraform-vars", "tf" },
	},
	-- yamlfix = {},
	-- nilaway = {},
}

if vim.fn.executable("nix") == 1 then
	server_opts.nil_ls = {
		settings = {
			["nil"] = {
				formatting = {
					command = { "nixfmt" },
				},
			},
		},
	}
end

local ensure_installed = {}
for server, _ in pairs(server_opts) do
	ensure_installed[#ensure_installed + 1] = server
end

local mason_lsp = require("mason-lspconfig")
mason_lsp.setup({
	ensure_installed = ensure_installed,
})

local blink = require("blink.cmp")
local capabilities =
	vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities({}, false), {
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
-- 	end,
-- })
--:

--: Mini
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		vim.pack.add({
			"https://github.com/nvim-mini/mini.surround",
			-- "https://github.com/nvim-mini/mini.pairs",
			"https://github.com/nvim-mini/mini.ai",
			"https://github.com/nvim-mini/mini.comment",
			"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
		})

		require("mini.surround").setup({
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		})

		-- require("mini.pairs").setup({})
		require("mini.ai").setup({})

		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})

		require("mini.comment").setup({
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		})
	end,
})
--:

--: Hop
-- vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
-- 	once = true,
-- 	callback = function()
-- 		vim.pack.add({
-- 			"https://github.com/phaazon/hop.nvim",
-- 		})
--
-- 		require("hop").setup({})
--
-- 		vim.keymap.set("n", "<leader>jj", "<cmd>HopWord<CR>", { desc = "Jump to word" })
-- 		vim.keymap.set("n", "<leader>jk", "<cmd>HopWordMW<CR>", { desc = "Jump to word in all panes" })
-- 		vim.keymap.set("n", "<leader>jl", "<cmd>HopLine<CR>", { desc = "jump to line" })
-- 		vim.keymap.set("n", "<leader>jL", "<cmd>HopLineMW<CR>", { desc = "Jump to line in all panes" })
-- 	end,
-- })
-- --:
