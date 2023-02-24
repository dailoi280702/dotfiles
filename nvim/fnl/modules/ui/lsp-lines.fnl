(import-macros {: pack} :macros)

(pack :Maan2003/lsp_lines.nvim
      {:dependencies :nvim-lspconfig
       :event [:BufNewFile :BufReadPost]
       :config (fn []
                 ((. (require :lsp_lines) :setup) {}))})
