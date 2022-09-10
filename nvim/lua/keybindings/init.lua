local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- map("n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", opts)
-- map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", opts)

-- map("n", "<Tab>", "<cmd>BufferNext<cr>", opts)
-- map("n", "<S-Tab>", "<cmd>BufferPrevious<cr>", opts)

-- map("n", "<space>bp", "<cmd>BufferPin<cr>", opts)
-- map("n", "<space>bc", "<cmd>BufferClose<cr>", opts)

map("n", "<tab>", "<cmd>bnext<cr><cmd>redraw<cr>", opts)
map("n", "<s-tab>", "<cmd>bprevious<cr><cmd>redraw<cr>", opts)
map("n", "<leader>bc", "<cmd>bdelete<cr>", opts)
