  -- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').html.setup {
  capabilities = capabilities
}

require'lspconfig'.cssls.setup{
  capabilities = capabilities 
}
  
require'lspconfig'.tsserver.setup{
  capabilities = capabilities 
}
