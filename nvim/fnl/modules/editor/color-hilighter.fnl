(import-macros {: pack : map!} :macros)

(pack :NvChad/nvim-colorizer.lua
      {:cmd [:ColorizerToggle]
       :config (fn []
                 ((. (require :colorizer) :setup) {}))})
