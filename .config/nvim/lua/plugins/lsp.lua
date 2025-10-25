local lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	dependencies = {
		"mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
}

lsp.keys = {
	{ "<leader>e", vim.diagnostic.open_float, desc = "Show Diagnostic" },
	{ "[d", vim.diagnostic.jump({ count = -1 }), desc = "Goto Prev Diagnostic" },
	{ "]d", vim.diagnostic.jump({ count = 1 }), desc = "Goto Next Diagnostic" },
	{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
	{
		"gd",
		function()
			require("telescope.builtin").lsp_definitions({ reuse_win = true })
		end,
		desc = "Goto Definition",
	},
	{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
	{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
	{
		"gI",
		function()
			require("telescope.builtin").lsp_implementations({ reuse_win = true })
		end,
		desc = "Goto Implementation",
	},
	{
		"gy",
		function()
			require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
		end,
		desc = "Goto T[y]pe Definition",
	},
	-- { "K", vim.lsp.buf.hover, desc = "Hover" },
	{ "<leader>K", vim.lsp.buf.hover, desc = "Hover" },
	{ "<leader>D", vim.lsp.buf.type_definition, desc = "Goto Type Definition" },
	{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
	{ "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
	{
		"<leader>ca",
		vim.lsp.buf.code_action,
		desc = "Code Action",
		mode = { "n", "v" },
	},
	{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
}

lsp.opts = {
	servers = {
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
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = {
						enable = false,
					},
				},
			},
		},
		-- bufls = {},
		-- golangci_lint_ls = {},
		eslint = {},
		rust_analyzer = {},
		terraformls = {
			-- filetypes = { "terraform", "terraform-vars", "tf" },
		},
		-- yamlfix = {},
		nil_ls = {
			settings = {
				["nil"] = {
					formatting = {
						command = { "nixfmt" },
					},
				},
			},
		},
		-- nilaway = {},
	},
	setup = {},
}

lsp.config = function(_, opts)
	local blink = require("blink.cmp")
	local mason_lsp = require("mason-lspconfig")
	local servers = opts.servers

	local ensure_installed = {}
	for server, _ in pairs(servers) do
		ensure_installed[#ensure_installed + 1] = server
	end

	mason_lsp.setup({
		ensure_installed = ensure_installed,
	})

	local default_config = {
		capabilities = blink.get_lsp_capabilities(),
	}

	vim.schedule(function()
		for server_name, server_opts in pairs(opts.servers) do
			vim.lsp.config(server_name, vim.tbl_deep_extend("force", default_config, server_opts or {}))
		end
	end)
end

local mason = {
	"mason-org/mason.nvim",
	cmd = "Mason",
	keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
	build = ":MasonUpdate",
	opts = {
		ensure_installed = {
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
		},
	},
}

mason.config = function(_, opts)
	require("mason").setup(opts)
	local mr = require("mason-registry")

	local function ensure_installed()
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end
	end

	if mr.refresh then
		mr.refresh(ensure_installed)
	else
		ensure_installed()
	end
end

return { lsp, mason }