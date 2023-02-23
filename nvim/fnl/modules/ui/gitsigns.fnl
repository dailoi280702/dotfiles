(import-macros {: pack} :macros)

(pack :lewis6991/gitsigns.nvim
      {:event [:BufReadPost :BufNewFile]
       :config (fn []
                 ((. (require :gitsigns) :setup)))})
