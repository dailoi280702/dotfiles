(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(local kitty-themes {:oxocarbon :oxocarbon
                     :gruvbox-material :gruvbox-material-dark-hard
                     :solarized :solarzied-dark
                     :kanagawa :kanagawa-dragon})

;; fnlfmt: skip
(fn migrate-to-lsp-sematic []
  (local links {"@lsp.type.class" "@type"
                "@lsp.type.decorator" "@function"
                "@lsp.type.enum" "@type"
                "@lsp.type.enumMember" "@constant"
                "@lsp.type.function" "@function"
                "@lsp.type.interface" "@type"
                "@lsp.type.macro" "@macro"
                "@lsp.type.method" "@method"
                "@lsp.type.namespace" "@namespace"
                "@lsp.type.parameter" "@parameter"
                "@lsp.type.property" "@property"
                "@lsp.type.struct" "@structure"
                "@lsp.type.type" "@type"
                "@lsp.type.variable" "@variable"})
  (each [newgroup oldgroup (pairs links)]
    (vim.api.nvim_set_hl 0 newgroup {:default true :link oldgroup}))
  )

(fn setup [name]
  (match name
    :oxocarbon (do
                 ;; (set-hl! 0 :StatusLine {:bg "#161616"})
                 ;; (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"})))
  ;; disable lsp sematic highlighting
  (migrate-to-lsp-sematic)
  ;; (each [_ group (ipairs (vim.fn.getcompletion "@lsp" :highlight))]
  ;;   (vim.api.nvim_set_hl 0 group {}))
  ;; kitty colorshcheme migration
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon))})
 (pack :savq/melange-nvim {:lazy false})
 ; (pack :kaiuri/nvim-juliana
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :nvim-juliana) :setup) {})
 ;                  (vim.cmd.colorscheme :juliana))})
 ; (pack :rebelot/kanagawa.nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :kanagawa) :setup) {:commentStyle {:italic false}
 ;                                                   :keywordStyle {:italic false}
 ;                                                   :colors {:theme {:all {:ui {:bg_gutter :none}}}}})
 ;                  (vim.cmd.colorscheme :kanagawa-dragon))})
 ; (pack :maxmx03/solarized.nvim {:lazy false
 ;                                :config (fn []
 ;                                          (local solarized (require :solarized))
 ;                                          (set vim.o.background :dark)
 ;                                          (solarized:setup {:config {:theme :neovim
 ;                                                                     :transparent true}
 ;                                                            :colors {:bg "#001217"
 ;                                                                     :bg_alt "#002b36"}
 ;                                                            :highlights (fn [colors
 ;                                                                             _
 ;                                                                             _
 ;                                                                             _]
 ;                                                                          {:FoldColumn {:fg colors.bg_alt}
 ;                                                                           :Folded {:bg nil}})})
 ;                                          (vim.cmd "colorscheme solarized")
 ;                                          )})
 ; (pack :/folke/tokyonight.nvim
 ;       {:lazy false :config (fn [] (vim.cmd.colorscheme :tokyonight-night))})
 ; (pack :catppuccin/nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :catppuccin) :setup) {})
 ;                  (vim.cmd.colorscheme :catppuccin))})
 ]
