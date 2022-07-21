require("nvim-tree").setup({})

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1

vim.cmd([[
  nnoremap <C-n> :NvimTreeToggle<CR>
  nnoremap <leader>r :NvimTreeRefresh<CR>
  nnoremap <leader>n :NvimTreeFindFile<CR>
]])
