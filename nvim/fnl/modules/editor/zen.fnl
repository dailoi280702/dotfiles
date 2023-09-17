(import-macros {: pack} :macros)

(fn config []
  (local nnp (require :no-neck-pain))
  (nnp.setup {:width 100
              :buffers {:disableOnLastBuffer true :right {:enabled true}}}) ; (nnp.toggle)
  )

(pack :shortcuts/no-neck-pain.nvim
      {:enabled false :cmd :NoNeckPain : config :event [:VimEnter]})
