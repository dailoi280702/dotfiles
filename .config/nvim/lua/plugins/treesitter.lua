local M = {}

table.insert(M, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		local supported_languages = {}
		for _, lang in ipairs(ts.get_available()) do
			supported_languages[lang] = true
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype

				if not supported_languages[ft] then
					return
				end

				if not pcall(vim.treesitter.start) then
					ts.install(ft)
				end
			end,
		})
	end,
})

return M