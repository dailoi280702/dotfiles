local M = {
	"kevinhwang91/nvim-ufo",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "kevinhwang91/promise-async" },
	enabled = false,
}

M.config = function()
	local ufo = require("ufo")

	vim.keymap.set("n", "z,", "<cmd>%foldclose<CR>", { desc = "Close first level folds" })
	vim.keymap.set("n", "z.", "<cmd>sil! normal mzzM`zzO<CR>", { desc = "Magic fold  " })
	vim.keymap.set("n", "zM", ufo.closeAllFolds)
	vim.keymap.set("n", "zR", ufo.openAllFolds)

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
end

return M