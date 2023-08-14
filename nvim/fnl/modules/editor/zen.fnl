(import-macros {: pack} :macros)

(fn config []
  (local nnp (require :no-neck-pain))
  (nnp.setup {:width 100 :buffers {:right {:enabled true}}}))

(pack :shortcuts/no-neck-pain.nvim {:cmd :NoNeckPain : config})
