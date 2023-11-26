(import-macros {: pack} :macros)

(fn config []
  (local ts (require :nvim-treesitter.configs))
  (ts.setup {:ensure_installed :all
             :highlight {:enable true
                         :use_languagetree false
                         :additional_vim_regex_highlighting false}
             :indent {:enable true}
             :autotag {:enable true}
             ; :rainbow {:enable false
             ;           :extended_mode false
             ;           :colors ["#878d96"
             ;                    "#a8a8a8"
             ;                    "#8d8d8d"
             ;                    "#a2a9b0"
             ;                    "#8f8b8b"
             ;                    "#ada8a8"
             ;                    "#878d96"]}
             }) ; ((. (require :treesitter-context) :setup) {:max_lines 3})
  (set vim.g.skip_ts_context_commentstring_module true)
  ((. (require :ts_context_commentstring) :setup)))

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
       :dependencies [; :nvim-treesitter/nvim-treesitter-context
                      :JoosepAlviste/nvim-ts-context-commentstring]
       : config})

