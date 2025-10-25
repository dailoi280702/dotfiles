local lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	dependencies = {
		"mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
}

-- "gra" is mapped in Normal and Visual mode to vim.lsp.buf.code_action()
-- "gri" is mapped in Normal mode to vim.lsp.buf.implementation()
-- "grn" is mapped in Normal mode to vim.lsp.buf.rename()
-- "grr" is mapped in Normal mode to vim.lsp.buf.references()
-- "grt" is mapped in Normal mode to vim.lsp.buf.type_definition()
-- "gO" is mapped in Normal mode to vim.lsp.buf.document_symbol()
-- CTRL-S is mapped in Insert mode to vim.lsp.buf.signature_help()
lsp.keys = {
	{
		"gd",
		function()
			require("telescope.builtin").lsp_definitions({ reuse_win = true })
		end,
		desc = "Goto Definition",
	},
	{ "grD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
	{ "grr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
	{
		"gri",
		function()
			require("telescope.builtin").lsp_implementations({ reuse_win = true })
		end,
		desc = "Goto Implementation",
	},
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
			command = { "golangci-lint", "run", "--output.json.path=stdout", "--show-stats=false" },
		},
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

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities({}, false))
	capabilities = vim.tbl_deep_extend("force", capabilities, {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	})

	local default_opts = {
		capabilities = capabilities,
	}

	vim.schedule(function()
		for server_name, server_opts in pairs(opts.servers) do
			vim.lsp.config(server_name, vim.tbl_deep_extend("force", default_opts, server_opts or {}))
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