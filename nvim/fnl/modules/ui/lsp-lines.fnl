(import-macros {: pack : map!} :macros)

(fn config []
  (local {: toggle : setup} (require :lsp_lines))
  (map! [n] :<leader>tl `(toggle) {:desc "Toggle lsp_lines"})
  (setup {}))

(pack :Maan2003/lsp_lines.nvim {:dependencies :nvim-lspconfig
                                :event [:BufNewFile :BufReadPost]
                                :enabled false
                                : config})
