(import-macros {: pack} :macros)

(fn config []
  (local {: setup : register} (require :which-key))
  (setup {:icons {:breadcrumb "»" :separator "->" :group "+"}
          :popup_mappings {:scroll_down :<c-d> :scroll_up :<c-u>}
          :window {:border :none}
          :layout {:align :center :spacing 3}
          :hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "]
          :triggers_blacklist {:i [:j :k] :v [:j :k]}})
  (register {:<leader>b {:name :+buffer}})
  (register {:<leader>c {:name :+code}})
  (register {:<leader>g {:name :+git}})
  (register {:<leader>h {:name :+help}})
  (register {:<leader>o {:name :+open}})
  (register {:<leader>t {:name :+toogle}})
  (register {:<leader>f {:name :+fold}})
  (register {:<leader>j {:name :+jump}}))

;   (register {:<leader>cl {:name :+LSP}})
;   (register {:<leader>w {:name :+window}})

(pack :folke/which-key.nvim {:keys [:<leader> "\"" "'" "`" :z] : config})
