(import-macros {: pack : set-hl! : autocmd! : augroup! : let!} :macros)

; (local {: nil?} (require :core.lib.types))
(local kitty-themes {:oxocarbon :oxocarbon
                     :gruvbox-material :gruvbox-material-dark-hard
                     :kanagawa :kanagawa-dragon})

(fn setup [name]
  (match name
    :oxocarbon (do
                 (set-hl! 0 :StatusLine {:bg "#161616"})
                 (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"})))
  ;; todo: fix heirline after change colors
  ;; (let [(has_heirline heirline) (pcall require :heirline)]
  ;;   (when has_heirline
  ;;     (local {: on_colorscheme : get_highlight} (require :heirline.utils))
  ;;     (on_colorscheme {:bright_bg (. (get_highlight :Folded) :bg)
  ;;                      :bright_fg (. (get_highlight :Folded) :fg)
  ;;                      :red (. (get_highlight :Folded) :fg)
  ;;                      :dark_red (. (get_highlight :Folded) :bg)
  ;;                      :green (. (get_highlight :Folded) :fg)
  ;;                      :blue (. (get_highlight :Folded) :fg)
  ;;                      :gray (. (get_highlight :Folded) :fg)
  ;;                      :orange (. (get_highlight :Folded) :fg)
  ;;                      :purple (. (get_highlight :Folded) :fg)
  ;;                      :cyan (. (get_highlight :Folded) :fg)
  ;;                      :diag_warn (. (get_highlight :Folded) :fg)
  ;;                      :diag_error (. (get_highlight :Folded) :fg)
  ;;                      :diag_hint (. (get_highlight :Folded) :fg)
  ;;                      :diag_info (. (get_highlight :Folded) :fg)
  ;;                      :git_del (. (get_highlight :Folded) :fg)
  ;;                      :git_add (. (get_highlight :Folded) :fg)
  ;;                      :git_change (. (get_highlight :Folded) :fg)})))
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn [] ; (vim.cmd.colorscheme :oxocarbon)
                  )})
 (pack :sainnhe/gruvbox-material
       {:lazy false
        :config (fn []
                  (let! :gruvbox_material_background :hard)
                  (let! :gruvbox_material_better_performance 1)
                  (let! :gruvbox_material_enable_bold 1))})
 (pack :rebelot/kanagawa.nvim
       {:lazy false
        :config (fn []
                  (local {: setup : load} (require :kanagawa))
                  (setup {:theme :dragon
                          :colors {:theme {:all {:ui {:bg_gutter :none}}}}
                          ; :overrides (fn [_]
                          ;              {:FoldColumn {:bg :NONE}
                          ;               :SignColumn {:bg :NONE}
                          ;               :ColorColumn {:bg :NONE}
                          ;               :GitSignsAdd {:bg :NONE}
                          ;               :GitSignsChange {:bg :NONE}
                          ;               :GitSignsDelete {:bg :NONE}
                          ;               :DiagnosticError {:bg :NONE}
                          ;               :DiagnosticWarn {:bg :NONE}
                          ;               :DiagnosticInfo {:bg :NONE}
                          ;               :DiagnosticHint {:bg :NONE}})
                          :compile true})
                  (load :dragon))})
 ; (pack :Mofiqul/dracula.nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :dracula) :setup) {:colors {:bg "#22212C"
 ;                                                           :fg "#F8F8F2"
 ;                                                           :selection "#454158"
 ;                                                           :comment "#7970A9"
 ;                                                           :red "#FF9580"
 ;                                                           :orange "#FFCA80"
 ;                                                           :yellow "#FFFF80"
 ;                                                           :green "#8AFF80"
 ;                                                           :purple "#9580FF"
 ;                                                           :cyan "#80FFEA"
 ;                                                           :pink "#FF80BF"
 ;                                                           :bright_red "#FFAA99"
 ;                                                           :bright_green "#A2FF99"
 ;                                                           :bright_yellow "#FFFF99"
 ;                                                           :bright_blue "#AA99FF"
 ;                                                           :bright_magenta "#FF99CC"
 ;                                                           :bright_cyan "#99FFEE"
 ;                                                           :bright_white "#FFFFFF"
 ;                                                           :menu "#17161D"
 ;                                                           :visual "#2e2b38"
 ;                                                           ; :gutter_fg "#?"
 ;                                                           :nontext "#424450"
 ;                                                           :white "#FFFFFF"
 ;                                                           :black "#0B0B0F"}}))})
 ]
