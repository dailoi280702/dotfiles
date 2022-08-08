local map = vim.api.nvim_set_keymap

map(
	"n",
	"<C-u>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
	{ noremap = true, silent = true }
)
map(
	"n",
	"<C-d>",
	"<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
	{ noremap = true, silent = true }
)

-- map("n", "<C-j>", "<cmd>TablineBufferPrevious<CR>", { noremap = true, silent = true })
-- map("n", "<C-k>", "<cmd>TablineBufferNext<CR>", { noremap = true, silent = true })
-- map("n", "<leader><leader>", ":HopWordMW<CR>", { noremap = true, silent = true })
