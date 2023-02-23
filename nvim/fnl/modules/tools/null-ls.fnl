(import-macros {: pack} :macros)

(fn format []
  (let [buf (vim.api.nvim_get_current_buf)
        ft (. (. vim.bo buf) :filetype)
        has_nls (> (length ((. (require :null-ls.sources) :get_available) ft
                                                                          :NULL_LS_FORMATTING))
                   0)]
    (vim.lsp.buf.format {:bufnr buf
                         :filter (fn [client]
                                   (if has_nls
                                       (= client.name :null-ls)
                                       (not (= client.name :null-ls))))})))

(fn config []
  (local {: setup : builtins} (require :null-ls))
  (local {: formatting : diagnostics : code_actions} builtins)
  (local augroup (vim.api.nvim_create_augroup :LspFormatting {}))
  (setup {:sources [formatting.stylua
                    formatting.prettierd
                    formatting.gofumpt
                    formatting.fnlfmt
                    code_actions.eslint_d
                    diagnostics.eslint_d
                    diagnostics.golangci_lint]
          :on_attach (fn [client bufnr]
                       (when (client.supports_method :textDocument/formatting)
                         (vim.api.nvim_clear_autocmds {:group augroup
                                                       :buffer bufnr})
                         (vim.api.nvim_create_autocmd :BufWritePre
                                                      {:group augroup
                                                       :buffer bufnr
                                                       :callback format})))}))

(pack :jose-elias-alvarez/null-ls.nvim
      {:event [:BufReadPre :BufNewFile] : config})
