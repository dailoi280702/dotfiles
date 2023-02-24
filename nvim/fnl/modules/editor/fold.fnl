(import-macros {: pack : set! : map!} :macros)

(fn config []
  (local {: setup : openAllFolds : closeAllFolds} (require :ufo))
  (set! foldcolumn :1)
  (set! foldlevel 99)
  (set! foldlevelstart 99)
  (set! foldenable)
  (map! [n] "z," "<cmd>%foldclose<CR>" {:desc "Close first level folds"})
  (map! [n] :z. "<cmd>normal mazMzOzv`a<CR>"
        {:desc "Close all folds except current"})
  (map! [n] :zR `(openAllFolds) {:desc "Open all folds"})
  (map! [n] :zM `(closeAllFolds) {:desc "Close all folds"})
  ((. (require :ufo) :setup) {:provider_selector (fn [_ _ _]
                                                   [:treesitter :indent])}))

(pack :kevinhwang91/nvim-ufo {:event [:BufReadPost :BufNewFile]
                              :after :nvim-treesitter
                              :dependencies [:kevinhwang91/promise-async]
                              : config})
