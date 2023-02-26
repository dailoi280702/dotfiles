(import-macros {: pack} :macros)

(pack :NvChad/nvim-colorizer.lua
      {:cmd [:ColorizerToggle]
       :config (fn []
                 ((. (require :colorizer) :setup) {}))})
