(import-macros {: pack} :macros)

(fn config []
  (local ts (require :nvim-treesitter.configs))
  (ts.setup {:ensure_installed :all
             :highlight {:enable true
                         ; :use_languagetree true
                         }
             :indent {:enable true}
             :context_commentstring {:enable true}
             :autotag {:enable true}
             :rainbow {:enable true
                       :extended_mode true
                       :colors ["#878d96"
                                "#a8a8a8"
                                "#8d8d8d"
                                "#a2a9b0"
                                "#8f8b8b"
                                "#ada8a8"
                                "#878d96"]}}))

(pack :nvim-treesitter/nvim-treesitter
      {:build ":TSUpdate"
       :event [:BufReadPost :BufNewFile :InsertEnter]
       :cmd [:TSInstall
             :TSUpdate
             :TSBufEnable
             :TSBufDisable
             :TSEnable
             :TSDisable
             :TSModuleInfo]
       :dependencies [:p00f/nvim-ts-rainbow
                      ;:/HiPhish/nvim-ts-rainbow2
                      :JoosepAlviste/nvim-ts-context-commentstring]
       : config})
