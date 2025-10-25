local M = {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}

M.opts = {
	current_line_blame = true,

	on_attach = function(buffer)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, desc)
			vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
		end

		map("n", "]h", gs.next_hunk, "Next Hunk")
		map("n", "[h", gs.prev_hunk, "Prev Hunk")
	end,
}

return M