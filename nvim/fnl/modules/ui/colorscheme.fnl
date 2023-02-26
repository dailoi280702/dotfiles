(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)
(local {: nil?} (require :core.lib.types))

(fn setup [name]
  (local heirline-colors
         {:oxocarbon {:blue "#82cfff"
                      :bright_bg "#262626"
                      :bright_fg "#525252"
                      :cyan "#3ddbd9"
                      :dark_red "#ee5396"
                      :diag_error "#ee5396"
                      :diag_hint "#78a9ff"
                      :diag_info "#dde1e6"
                      :diag_warn "#3ddbd9"
                      :git_add "#08bdba"
                      :git_change "#78a9ff"
                      :git_del "#ee5396"
                      :gray "#525252"
                      :green "#42be65"
                      :orange ""
                      :purple "#be95ff"
                      :red "#ff7eb6"
                      :subtext1 "#525252"}})
  (match name
    :oxocarbon (do
                 (set-hl! 0 :StatusLine {:bg "#161616"})
                 (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"})))
  ;; todo: fix heirline after change colors
  ;; (let [(has_heriline heirline) (pcall require :heirline)
  ;;       opts (. heirline-colors name)]
  ;;   (when (and has_heriline (not (nil? opts)))
  ;;     (print (vim.inspect opts))
  ;;     (heirline.load_colors opts)))
  )

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon))})
 (pack :Mofiqul/dracula.nvim
       {:lazy false
        :config (fn []
                  ((. (require :dracula) :setup) {:colors {:bg "#22212C"
                                                           :fg "#F8F8F2"
                                                           :selection "#454158"
                                                           :comment "#7970A9"
                                                           :red "#FF9580"
                                                           :orange "#FFCA80"
                                                           :yellow "#FFFF80"
                                                           :green "#8AFF80"
                                                           :purple "#9580FF"
                                                           :cyan "#80FFEA"
                                                           :pink "#FF80BF"
                                                           :bright_red "#FFAA99"
                                                           :bright_green "#A2FF99"
                                                           :bright_yellow "#FFFF99"
                                                           :bright_blue "#AA99FF"
                                                           :bright_magenta "#FF99CC"
                                                           :bright_cyan "#99FFEE"
                                                           :bright_white "#FFFFFF"
                                                           :menu "#17161D"
                                                           :visual "#2e2b38"
                                                           ; :gutter_fg "#?"
                                                           :nontext "#424450"
                                                           :white "#393649"
                                                           :black "#0B0B0F"}}))})]
