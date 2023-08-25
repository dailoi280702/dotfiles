(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(fn migrate-to-kitty [name]
  (local kitty-themes {:oxocarbon :oxocarbon
                       :gruvbox-material :gruvbox-material-dark-hard
                       :tokyonight :tokyonight_night
                       :rose-pine :rose-pine
                       :solarized :solarzied-dark
                       :embark :embark
                       :catppuccin-mocha :catppuccin-mocha
                       :kanagawa :kanagawa})
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

(fn setup [name]
  (match name
    :oxocarbon (do
                 ;; (set-hl! 0 :StatusLine {:bg "#161616"})
                 (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :Pmenu {:bg "#000000"})
                 ;; (set-hl! 0 :Normal {:bg ""})
                 ;; (set-hl! 0 :NormalNC {:bg ""})
                 ;; (set-hl! 0 :SignColumn {:bg ""})
                 ;; (set-hl! 0 :FoldColumn {:bg "" :fg "#262626"})
                 (set-hl! 0 "@punctuation.bracket" {:fg "#6f6f6f"})
                 (set-hl! 0 :LineNr {:bg "" :fg "#393939"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))
    :melange (do
               (vim.cmd "TSDisable rainbow")
               (set-hl! 0 :Normal {:bg ""}))
    :catppuccin (do
                  (set-hl! 0 :Folded {:bg ""})
                  (vim.cmd "TSDisable rainbow"))
    :gruvbox-material (do
                        (set-hl! 0 :StatusLine {:bg "#1f1f1f"})
                        (set-hl! 0 :StatusLineNC {:bg "#1f1f1f" :fg "#1f1f1f"})))
  ;; kitty colorshcheme migration
  ;(migrate-to-kitty name)
  )

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  ;(vim.cmd.colorscheme :oxocarbon)
                  )})
 (pack :sainnhe/gruvbox-material
       {:lazy false
        :priority 999
        :enabled false
        :config (fn []
                  (set vim.g.gruvbox_material_transparent_background 1)
                  (set vim.g.better_performance 1)
                  (vim.cmd.colorscheme :gruvbox-material))})
 (pack :rebelot/kanagawa.nvim {:lazy false
                               :enabled true
                               :config (fn []
                                         ((. (require :kanagawa) :setup) {:transparent false
                                                                          :functionStyle {:bold true}
                                                                          :keywordStyle {:italic false}
                                                                          :statementStyle {:italic false}
                                                                          :overrides (fn [colors]
                                                                                       (let [theme colors.theme]
                                                                                         {; :Normal {:bg theme.ui.bg_m3}
                                                                                          :StatusLineNC {:bg :NONE}
                                                                                          :StatusLine {:bg :NONE}
                                                                                          :TelescopePreviewBorder {:bg theme.ui.bg_dim
                                                                                                                   :fg theme.ui.bg_dim}
                                                                                          :TelescopePreviewNormal {:bg theme.ui.bg_dim}
                                                                                          :TelescopePromptBorder {:bg theme.ui.bg_p1
                                                                                                                  :fg theme.ui.bg_p1}
                                                                                          :TelescopePromptNormal {:bg theme.ui.bg_p1}
                                                                                          :TelescopeResultsBorder {:bg theme.ui.bg_m1
                                                                                                                   :fg theme.ui.bg_m1}
                                                                                          :TelescopeResultsNormal {:bg theme.ui.bg_m1
                                                                                                                   :fg theme.ui.fg_dim}
                                                                                          :TelescopeTitle {:bold true
                                                                                                           :fg theme.ui.special}
                                                                                          :LazyNormal {:bg theme.ui.bg_m2
                                                                                                       :fg theme.ui.fg_dim}
                                                                                          :MasonNormal {:bg theme.ui.bg_m2
                                                                                                        :fg theme.ui.fg_dim}
                                                                                          :NormalDark {:bg theme.ui.bg_m2
                                                                                                       :fg theme.ui.fg_dim}
                                                                                          ; :NormalFloat {:bg :none}
                                                                                          :Pmenu {:bg theme.ui.bg_p1
                                                                                                  :fg theme.ui.shade0}
                                                                                          :PmenuSbar {:bg theme.ui.bg_m1}
                                                                                          :PmenuSel {:bg theme.ui.bg_p2
                                                                                                     :fg :NONE}
                                                                                          :PmenuThumb {:bg theme.ui.bg_p2}
                                                                                          :FloatBorder {:bg :none}
                                                                                          :FloatTitle {:bg :none}}))
                                                                          :colors {:theme {:all {:ui {:bg_gutter :none}}}}})
                                         ; (vim.cmd.colorscheme :kanagawa)
                                         )})
 (pack :Mofiqul/vscode.nvim {:lazy false})
 (pack :projekt0n/caret.nvim {:lazy false})
 (pack :projekt0n/github-nvim-theme
       {:lazy false
        :priority 1000
        :config (fn []
                  (local specs {:all {:syntax {:bracket :gray.bright}}})
                  (local groups
                         {:all {:TelescopePreviewBorder {:bg :bg0 :fg :bg0}
                                :TelescopePreviewNormal {:bg :bg0}
                                :TelescopePromptBorder {:bg :bg3 :fg :bg3}
                                :TelescopePromptNormal {:bg :bg3}
                                :TelescopeResultsBorder {:bg :bg2 :fg :bg2}
                                :TelescopeResultsNormal {:bg :bg2 :fg ""}
                                :TelescopeTitle {:bold true :fg :palette.cyan}}})
                  (local gh-theme (require :github-theme))
                  (gh-theme.setup {: groups : specs})
                  (vim.cmd.colorscheme :github_dark_dimmed))})]
