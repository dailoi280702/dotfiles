(import-macros {: pack : set! : set-hl! : autocmd! : augroup! : let!} :macros)

(fn migrate-to-kitty [name]
  (local kitty-themes {:oxocarbon :oxocarbon
                       :gruvbox-material :gruvbox
                       :tokyonight :tokyonight_night
                       :solarized :solarzied-dark
                       :catppuccin-mocha :catppuccin-mocha
                       :kanagawa :kanagawa-dragon})
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

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
                 (migrate-to-lsp-sematic)
                 (vim.cmd "TSEnable rainbow")
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))
    :gruvbox-material (do
                        (vim.cmd "TSDisable rainbow")
                        (set-hl! 0 "@punctuation.bracket" {:fg "#928374"}))
    :catppuccin-mocha (do
                        (vim.cmd "TSDisable rainbow")
                        (local colors
                               ((. (require :catppuccin.palettes) :get_palette)))
                        (set-hl! 0 :Folded {:bg colors.none})
                        (set-hl! 0 "@punctuation.bracket" {:fg colors.overlay1}))
    :rose-pine (do
                 (set! cursorline)
                 (vim.cmd "TSDisable rainbow"))
    _ (vim.cmd "TSEnable rainbow"))
  ;; disable lsp sematic highlighting
  ;; (each [_ group (ipairs (vim.fn.getcompletion "@lsp" :highlight))]
  ;;   (vim.api.nvim_set_hl 0 group {}))
  ;; kitty colorshcheme migration
  ;; (migrate-to-kitty name)
  )

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

;; fnlfmt: skip
; (pack :sainnhe/gruvbox-material
;        {:lazy false
;         :config (fn []
;                   (let! :gruvbox_material_disable_italic_comment 1)
;                   ;; (let! :gruvbox_material_enable_bold 1)
;                   (let! :gruvbox_material_spell_foreground :colored)
;                   (let! :gruvbox_material_better_performance 1)
;                   ;; (let! gruvbox_material_colors_override {})
;                   (let! :gruvbox_material_foreground :original)
;                   (let! :gruvbox_material_transparent_background 1)
;                   ;;(let! :gruvbox_material_background :medium)
;                   (vim.cmd.colorscheme :gruvbox-material))})

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon))})
 (pack :rose-pine/neovim
       {:lazy false :config (fn [] (vim.cmd.colorscheme :rose-pine-dawn))})
 (pack :catppuccin/nvim {:lazy false
                         :config (fn []
                                   ((. (require :catppuccin) :setup) {:transparent_background false
                                                                      :integrations {:hop true
                                                                                     :noice true
                                                                                     :notify true
                                                                                     :treesitter_context true}
                                                                      :custom_highlights (fn [C]
                                                                                           {:CmpItemKindClass {:bg C.yellow
                                                                                                               :fg C.base}
                                                                                            :CmpItemKindColor {:bg C.red
                                                                                                               :fg C.base}
                                                                                            :CmpItemKindConstant {:bg C.peach
                                                                                                                  :fg C.base}
                                                                                            :CmpItemKindConstructor {:bg C.blue
                                                                                                                     :fg C.base}
                                                                                            :CmpItemKindCopilot {:bg C.teal
                                                                                                                 :fg C.base}
                                                                                            :CmpItemKindEnum {:bg C.green
                                                                                                              :fg C.base}
                                                                                            :CmpItemKindEnumMember {:bg C.red
                                                                                                                    :fg C.base}
                                                                                            :CmpItemKindEvent {:bg C.blue
                                                                                                               :fg C.base}
                                                                                            :CmpItemKindField {:bg C.green
                                                                                                               :fg C.base}
                                                                                            :CmpItemKindFile {:bg C.blue
                                                                                                              :fg C.base}
                                                                                            :CmpItemKindFolder {:bg C.blue
                                                                                                                :fg C.base}
                                                                                            :CmpItemKindFunction {:bg C.blue
                                                                                                                  :fg C.base}
                                                                                            :CmpItemKindInterface {:bg C.yellow
                                                                                                                   :fg C.base}
                                                                                            :CmpItemKindKeyword {:bg C.red
                                                                                                                 :fg C.base}
                                                                                            :CmpItemKindMethod {:bg C.blue
                                                                                                                :fg C.base}
                                                                                            :CmpItemKindModule {:bg C.blue
                                                                                                                :fg C.base}
                                                                                            :CmpItemKindOperator {:bg C.blue
                                                                                                                  :fg C.base}
                                                                                            :CmpItemKindProperty {:bg C.green
                                                                                                                  :fg C.base}
                                                                                            :CmpItemKindReference {:bg C.red
                                                                                                                   :fg C.base}
                                                                                            :CmpItemKindSnippet {:bg C.mauve
                                                                                                                 :fg C.base}
                                                                                            :CmpItemKindStruct {:bg C.blue
                                                                                                                :fg C.base}
                                                                                            :CmpItemKindText {:bg C.teal
                                                                                                              :fg C.base}
                                                                                            :CmpItemKindTypeParameter {:bg C.blue
                                                                                                                       :fg C.base}
                                                                                            :CmpItemKindUnit {:bg C.green
                                                                                                              :fg C.base}
                                                                                            :CmpItemKindValue {:bg C.peach
                                                                                                               :fg C.base}
                                                                                            :CmpItemKindVariable {:bg C.flamingo
                                                                                                                  :fg C.base}})
                                                                      :color_overrides {:all {:base "#11111B"}}})
                                   ; (vim.cmd.colorscheme :catppuccin)
                                   )})
 (pack :rebelot/kanagawa.nvim {:lazy false
                               :config (fn []
                                         ((. (require :kanagawa) :setup) {:commentStyle {:italic false}
                                                                          :keywordStyle {:italic false}
                                                                          :colors {:theme {:all {:ui {:bg_gutter :none}}}}})
                                         ; (vim.cmd.colorscheme :kanagawa-dragon)
                                         )})]
