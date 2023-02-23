(import-macros {: pack} :macros)

(pack :nvim-tree/nvim-web-devicons
      {:dependencies [:DaikyXendo/nvim-material-icon]
       :event :VimEnter
       :config (fn []
                 (local {: get_icons} (require :nvim-material-icon))
                 (local {: setup} (require :nvim-web-devicons))
                 (setup {:override (get_icons)}))})
