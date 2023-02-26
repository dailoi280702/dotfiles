(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(fn setup [name]
  (match name
    :oxocarbon (do
                 (set-hl! 0 :StatusLine {:bg "#161616"})
                 (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))))

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
                                                           :black "#0B0B0F"}}))})
 (pack :jerryaugusto/dracula_pro.nvim {:lazy false})]
