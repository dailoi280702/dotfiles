(import-macros {: pack} :macros)

[(pack :windwp/nvim-autopairs
       {:event :InsertEnter
        :config (fn []
                  (local {: setup} (require :nvim-autopairs))
                  (local lisp-ft [:fennel :lisp :racket :scheme])
                  (setup {:disable_filetype lisp-ft}))})
 (pack :windwp/nvim-ts-autotag {:event :InsertEnter})]
