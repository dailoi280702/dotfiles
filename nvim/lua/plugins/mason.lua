return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		ensure_installed = {
			"prettierd",
			"stylua",
			-- "selene",
			"golangci-lint",
			"gofumpt",
			"eslint_d",
			"fixjson",
			"rust-analyzer",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)

		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end

		require("mason-lspconfig").setup({
			automatic_installation = true,
		})
	end,
}
