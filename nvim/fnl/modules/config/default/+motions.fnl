(import-macros {: pack} :macros)

[(pack :echasnovski/mini.comment
       {:event :VeryLazy
        :config (fn []
                  ((. (require :mini.comment) :setup) {:hook {:pre ((. (require :ts_context_commentstring.internal)
                                                                       :update_commentstring) {})}}))})
 (pack :echasnovski/mini.ai
       {:event :VeryLazy
        :dependencies [:nvim-treesitter/nvim-treesitter-textobjects]
        :config (fn []
                  ((. (require :mini.ai) :setup)))})
 (pack :echasnovski/mini.surround
       {:event :VeryLazy
        :config (fn []
                  ((. (require :mini.surround) :setup)))})
 (pack :phaazon/hop.nvim
       {:event :VeryLazy
        :config (fn []
                  ((. (require :hop) :setup)))})]
