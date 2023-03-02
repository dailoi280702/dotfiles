(import-macros {: pack} :macros)

(fn config []
  (local nnp (require :no-neck-pain))
  (nnp.setup {:buffers {:right {:enabled false}}}))

(pack :shortcuts/no-neck-pain.nvim {:cmd :NoNeckPain : config})
