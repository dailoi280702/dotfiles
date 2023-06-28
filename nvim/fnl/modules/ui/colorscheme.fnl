(import-macros {: pack : set! : set-hl! : autocmd! : augroup! : let!} :macros)

(fn migrate-to-kitty [name]
  (local kitty-themes {:oxocarbon :oxocarbon
                       :gruvbox-material :gruvbox
                       :tokyonight :tokyonight_moon
                       :solarized :solarzied-dark
                       :catppuccin-mocha :catppuccin-mocha
                       :tokyonight :tokyonight_moon
                       :kanagawa :kanagawa-dragon})
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

;; fnlfmt: skip
; (fn migrate-to-lsp-sematic []
;   (local links {"@lsp.type.class" "@type"
;                 "@lsp.type.decorator" "@function"
;                 "@lsp.type.enum" "@type"
;                 "@lsp.type.enumMember" "@constant"
;                 "@lsp.type.function" "@function"
;                 "@lsp.type.interface" "@type"
;                 "@lsp.type.macro" "@macro"
;                 "@lsp.type.method" "@method"
;                 "@lsp.type.namespace" "@namespace"
;                 "@lsp.type.parameter" "@parameter"
;                 "@lsp.type.property" "@property"
;                 "@lsp.type.struct" "@structure"
;                 "@lsp.type.type" "@type"
;                 "@lsp.type.variable" "@variable"})
;   (each [newgroup oldgroup (pairs links)]
;     (vim.api.nvim_set_hl 0 newgroup {:default true :link oldgroup}))
;   )

(fn setup [name]
  (match name
    :oxocarbon (do
                 ;; (set-hl! 0 :StatusLine {:bg "#161616"})
                 ;; (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 ;; (migrate-to-lsp-sematic)
                 (vim.cmd "TSEnable rainbow")
                 (set-hl! 0 :Folded {:bg "#161616"})
                 ;; (set-hl! 0 :Normal {:bg ""})
                 ;; (set-hl! 0 :NormalNC {:bg ""})
                 ;; (set-hl! 0 :SignColumn {:bg ""})
                 (set-hl! 0 :FoldColumn {:bg "" :fg "#262626"})
                 (set-hl! 0 :LineNr {:bg "" :fg "#393939"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))
    :melange (do
               (vim.cmd "TSDisable rainbow")
               (set-hl! 0 :Normal {:bg ""}))
    _ (vim.cmd "TSDisable rainbow"))
  ;; kitty colorshcheme migration
  ;; (migrate-to-kitty name)
  )

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn [] (vim.cmd.colorscheme :oxocarbon))})
 (pack :nvimdev/oceanic-material {:lazy false})
 ; (pack :savq/melange-nvim
 ;       {:lazy false :config (fn [] (vim.cmd.colorscheme :melange))})
 ]
