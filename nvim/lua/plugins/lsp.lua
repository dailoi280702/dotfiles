local function setup_diagnostic_signs()
	local signs = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	}

	for dtype, icon in pairs(signs) do
		local hl = ("DiagnosticSign" .. dtype)
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	vim.diagnostic.config({ underline = true, virtual_text = { spacing = 4, prefix = " " } })
end

local lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	lazy = true,
	dependencies = {
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}

lsp.keys = {
	{ "<leader>e", vim.diagnostic.open_float, desc = "Show Diagnostic" },
	{ "[d", vim.diagnostic.goto_prev, desc = "Goto Prev Diagnostic" },
	{ "]d", vim.diagnostic.goto_next, desc = "Goto Next Diagnostic" },
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
		ts_ls = {
			-- filetypes = {
			-- 	"html",
			-- 	"javascript",
			-- 	"javascriptreact",
			-- 	"javascript.jsx",
			-- 	"typescript",
			-- 	"typescriptreact",
			-- 	"typescript.tsx",
			-- },
		},
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
		lua_ls = {},
		bufls = {},
		-- fennel_language_server = {},
		golangci_lint_ls = {},
		eslint = {},
		rust_analyzer = {},
		terraformls = {
			-- filetypes = { "terraform", "terraform-vars", "tf" },
		},
		yamlfix = {},
	},
	setup = {},
}

lsp.config = function(_, opts)
	local lspconfig = require("lspconfig")
	local servers = opts.servers
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local ensure_installed = {}

	setup_diagnostic_signs()

	capabilities = vim.tbl_deep_extend(
		"force",
		{},
		vim.lsp.protocol.make_client_capabilities(),
		require("cmp_nvim_lsp").default_capabilities()
	)

	for server, _ in pairs(servers) do
		ensure_installed[#ensure_installed + 1] = server
	end

	require("mason-lspconfig").setup({
		ensure_installed = ensure_installed,
		handlers = {
			function(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				end

				lspconfig[server].setup(server_opts)
			end,
		},
	})

	-- vim.api.nvim_create_autocmd("LspAttach", {
	-- 	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	-- 	callback = function(ev)
	-- 		-- Enable completion triggered by <c-x><c-o>
	-- 		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
	--
	-- 		-- Buffer local mappings.
	-- 		-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- 		local opts = { buffer = ev.buf }
	-- 		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- 	end,
	-- })
	local no_sematic_hilight_servers = {
		"ts_ls",
		"lua_ls",
	}

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if vim.fn.index(no_sematic_hilight_servers, client.name) ~= 0 then
				client.server_capabilities.semanticTokensProvider = nil
			end
		end,
	})
end

local mason = {
	"williamboman/mason.nvim",
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