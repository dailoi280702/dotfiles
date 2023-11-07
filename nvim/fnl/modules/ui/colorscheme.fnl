(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(fn migrate-to-kitty [name]
  (local kitty-themes {:oxocarbon :oxocarbon
                       :gruvbox-material :gruvbox-material-dark-medium
                       :tokyonight :tokyonight_night
                       :github_dark_dimmed :github-dark-dimmed
                       :github_dark_tritanopia :github-dark-tritanopia
                       :rose-pine :rose-pine
                       :monokai-pro :monokai-classic
                       :gruvbox :gruvbox
                       :solarized :solarzied-dark
                       :embark :embark
                       :catppuccin-mocha :catppuccin-mocha
                       :kanagawa :kanagawa})
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

(fn setup [name]
  (match name
    :oxocarbon
    (do
      ; (set-hl! 0 :StatusLine {:bg "#161616"})
      (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
      (set-hl! 0 :Folded {:bg "#161616"})
      (set-hl! 0 :Pmenu {:bg "#000000"}) ; (set-hl! 0 :Normal {:bg ""}) ; (set-hl! 0 :NormalNC {:bg ""}) ; (set-hl! 0 :SignColumn {:bg ""}) ; (set-hl! 0 :FoldColumn {:bg "" :fg "#262626"})
      (set-hl! 0 "@punctuation.bracket" {:fg "#6f6f6f"})
      (set-hl! 0 :LineNr {:bg "" :fg "#393939"})
      (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
      (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
      (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))
    :melange
    (do
      (vim.cmd "TSDisable rainbow")
      (set-hl! 0 :Normal {:bg ""}))
    ;; :catppuccin (do
    ;;               (set-hl! 0 :Folded {:bg ""}))
    ;; :gruvbox-material
    ;; (do
    ;;   (set-hl! 0 "@punctuation.bracket" {:fg "#928174"})
    ;;   (set-hl! 0 :StatusLine {:bg "#181616"})
    ;;   (set-hl! 0 :NormalFloat {:bg "#181616"})
    ;;   (set-hl! 0 :FloatBorder {:bg "#181616"})
    ;;   (set-hl! 0 :StatusLineNC {:bg "#181816" :fg "#181616"}))
    )
  ;; kitty colorshcheme migration
  ;; (migrate-to-kitty name)
  )

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[; (pack :nyoom-engineering/oxocarbon.nvim
 ;       {:lazy false
 ;        :priority 1001
 ;        :config (fn []
 ;                  ;; (set vim.o.background :dark)
 ;                  (vim.cmd.colorscheme :oxocarbon))})
 ; ; (pack :craftzdog/solarized-osaka.nvim {:lazy false})
 ; (pack :nordtheme/vim {:lazy false})
 ; (pack :ribru17/bamboo.nvim {:lazy false})
 ; (pack :Mofiqul/dracula.nvim {:lazy false})
 ; (pack :p00f/alabaster.nvim
 ;       {:lazy false
 ;        :priority 1000
 ;        :config (fn [] (vim.cmd.colorscheme :alabaster))})
 ; (pack :deparr/tairiki.nvim {:lazy false})
 ; (pack :sainnhe/gruvbox-material {:lazy false
 ;                                  :priority 999
 ;                                  :enabled true
 ;                                  :config (fn []
 ;                                            (set vim.o.background :light)
 ;                                            (set vim.g.gruvbox_material_transparent_background
 ;                                                 1)
 ;                                            (set vim.g.gruvbox_material_enable_bold
 ;                                                 0)
 ;                                            (set vim.g.gruvbox_material_enable_italic
 ;                                                 0)
 ;                                            (set vim.g.gruvbox_material_better_performance
 ;                                                 1)
 ;                                            (set vim.g.gruvbox_material_foreground
 ;                                                 :original)
 ;                                            (set vim.g.gruvbox_material_background
 ;                                                 :medium)
 ;                                            ; (vim.cmd.colorscheme :gruvbox-material)
 ;                                            )})
 ; (pack :rebelot/kanagawa.nvim
 ;       {:lazy false
 ;        :enabled true
 ;        :config (fn []
 ;                  (fn overrides [colors]
 ;                    (let [theme colors.theme]
 ;                      {; :Normal {:bg theme.ui.bg_m3}
 ;                       :StatusLineNC {:bg :NONE}
 ;                       :StatusLine {:bg :NONE}
 ;                       :TelescopePreviewBorder {:bg theme.ui.bg_dim
 ;                                                :fg theme.ui.bg_dim}
 ;                       :TelescopePreviewNormal {:bg theme.ui.bg_dim}
 ;                       :TelescopePromptBorder {:bg theme.ui.bg_p1
 ;                                               :fg theme.ui.bg_p1}
 ;                       :TelescopePromptNormal {:bg theme.ui.bg_p1}
 ;                       :TelescopeResultsBorder {:bg theme.ui.bg_m1
 ;                                                :fg theme.ui.bg_m1}
 ;                       :TelescopeResultsNormal {:bg theme.ui.bg_m1
 ;                                                :fg theme.ui.fg_dim}
 ;                       :TelescopeTitle {:bold true :fg theme.ui.special}
 ;                       :LazyNormal {:bg theme.ui.bg_m2 :fg theme.ui.fg_dim}
 ;                       :MasonNormal {:bg theme.ui.bg_m2 :fg theme.ui.fg_dim}
 ;                       :NormalDark {:bg theme.ui.bg_m2 :fg theme.ui.fg_dim}
 ;                       ; :NormalFloat {:bg :none}
 ;                       :Pmenu {:bg theme.ui.bg_p1 :fg theme.ui.shade0}
 ;                       :PmenuSbar {:bg theme.ui.bg_m1}
 ;                       :PmenuSel {:bg theme.ui.bg_p2 :fg :NONE}
 ;                       :PmenuThumb {:bg theme.ui.bg_p2}
 ;                       :FloatBorder {:bg :none}
 ;                       :FloatTitle {:bg :none}}))
 ;
 ;                  ((. (require :kanagawa) :setup) {:transparent false
 ;                                                   ; :functionStyle {:bold false}
 ;                                                   ; :keywordStyle {:italic false}
 ;                                                   ; :statementStyle {:italic false}
 ;                                                   : overrides
 ;                                                   :colors {:theme {:all {:ui {:bg_gutter :none}}}}})
 ;                  (vim.cmd.colorscheme :kanagawa))})
 ; (pack :savq/melange-nvim
 ;       {:lazy false :config (fn [] (vim.cmd.colorscheme :melange))})
 ; (pack :catppuccin/nvim
 ;       {:lazy false
 ;        :enabled true
 ;        :config (fn []
 ;                  (local color_overrides
 ;                         {;; :macchiato {:base "#1b1b29"}
 ;                          :mocha {:rosewater "#efc9c2"
 ;                                  :flamingo "#ebb2b2"
 ;                                  :pink "#F2A7DE"
 ;                                  :mauve "#b889f4"
 ;                                  :red "#EA7183"
 ;                                  :maroon "#EA838C"
 ;                                  :peach "#F39967"
 ;                                  :yellow "#EACA89"
 ;                                  :green "#96d382"
 ;                                  :teal "#78cec1"
 ;                                  :sky "#91d7e3"
 ;                                  :sapphire "#68bae0"
 ;                                  :blue "#739df2"
 ;                                  :lavender "#a0a8f6"
 ;                                  :text "#b5c1f1"
 ;                                  :subtext1 "#a6b0d8"
 ;                                  :subtext0 "#959ec2"
 ;                                  :overlay2 "#848cad"
 ;                                  :overlay1 "#717997"
 ;                                  :overlay0 "#63677f"
 ;                                  :surface2 "#505469"
 ;                                  :surface1 "#3e4255"
 ;                                  :surface0 "#2c2f40"
 ;                                  :base "#1a1c29"
 ;                                  :mantle "#141620"
 ;                                  :crust "#0e0f16"}})
 ;
 ;                  (fn custom_highlights [C]
 ;                    {:Folded {:bg C.base}
 ;                     :FloatBorder {:fg C.mantle}
 ;                     :TelescopePreviewBorder {:bg C.mantle :fg C.mantle}
 ;                     :TelescopePreviewNormal {:bg C.mantle}
 ;                     :TelescopePromptBorder {:bg C.surface0 :fg C.surface0}
 ;                     :TelescopePromptNormal {:bg C.surface0}
 ;                     :TelescopeResultsBorder {:bg C.surface1 :fg C.surface1}
 ;                     :TelescopeResultsNormal {:bg C.surface1 :fg ""}
 ;                     :TelescopeTitle {:bold true :fg C.sky}
 ;                     ; :Normal {:bg C.base}
 ;                     })
 ;
 ;                  ((. (require :catppuccin) :setup) {:no_italic false
 ;                                                     :integrations {:hop true
 ;                                                                    :notify true
 ;                                                                    :treesitter_context true
 ;                                                                    :which_key true}
 ;                                                     : custom_highlights
 ;                                                     : color_overrides})
 ;                  (vim.cmd.colorscheme :catppuccin-mocha))})
 (pack :folke/tokyonight.nvim
       {:lazy false
        :config (fn []
                  ((. (require :tokyonight) :setup) {:on_highlights (fn [hl c]
                                                                      (local prompt
                                                                             "#2d3149")
                                                                      (set hl.TelescopeNormal
                                                                           {:bg c.bg_dark
                                                                            :fg c.fg_dark})
                                                                      (set hl.TelescopeBorder
                                                                           {:bg c.bg_dark
                                                                            :fg c.bg_dark})
                                                                      (set hl.TelescopePromptNormal
                                                                           {:bg prompt})
                                                                      (set hl.TelescopePromptBorder
                                                                           {:bg prompt
                                                                            :fg prompt})
                                                                      (set hl.TelescopePromptTitle
                                                                           {:bg prompt
                                                                            :fg prompt})
                                                                      (set hl.TelescopePreviewTitle
                                                                           {:bg c.bg_dark
                                                                            :fg c.bg_dark})
                                                                      (set hl.TelescopeResultsTitle
                                                                           {:bg c.bg_dark
                                                                            :fg c.bg_dark}))})
                  (vim.cmd.colorscheme :tokyonight-moon))})
 ; (pack :ellisonleao/gruvbox.nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :gruvbox) :setup) {:bold false
 ;                                                  :contrast ""
 ;                                                  :dim_inactive false
 ;                                                  :inverse true
 ;                                                  :invert_intend_guides false
 ;                                                  :invert_selection false
 ;                                                  :invert_signs false
 ;                                                  :invert_tabline false
 ;                                                  :italic {:comments false
 ;                                                           :emphasis true
 ;                                                           :folds false
 ;                                                           :operators false
 ;                                                           :strings false}
 ;                                                  :overrides {}
 ;                                                  :palette_overrides {}
 ;                                                  :strikethrough true
 ;                                                  :terminal_colors true
 ;                                                  :transparent_mode false
 ;                                                  :undercurl true
 ;                                                  :underline true})
 ;                  (vim.cmd "colorscheme gruvbox"))})
 ; (pack :projekt0n/github-nvim-theme
 ;       {:lazy false
 ;        :enabled true
 ;        :priority 1000
 ;        :config (fn []
 ;                  (local specs {:all {:syntax {:bracket :gray.bright}}})
 ;                  (local groups
 ;                         {:all {:TelescopePreviewBorder {:bg :bg0 :fg :bg0}
 ;                                :TelescopePreviewNormal {:bg :bg0}
 ;                                :TelescopePromptBorder {:bg :bg3 :fg :bg3}
 ;                                :TelescopePromptNormal {:bg :bg3}
 ;                                :TelescopeResultsBorder {:bg :bg2 :fg :bg2}
 ;                                :TelescopeResultsNormal {:bg :bg2 :fg ""}
 ;                                :TelescopeTitle {:bold true :fg :palette.cyan}}})
 ;                  (local gh-theme (require :github-theme))
 ;                  (local options
 ;                         {;;:styles {:comments :italic :functions "italic,bold"}
 ;                          :transparent false})
 ;                  (gh-theme.setup {: groups : specs : options})
 ;                  (vim.cmd.colorscheme :github_dark_dimmed))})
 ]
