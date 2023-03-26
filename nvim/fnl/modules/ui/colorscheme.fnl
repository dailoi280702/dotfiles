(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

; (local kitty-themes {:oxocarbon :oxocarbon
;                      :gruvbox-material :gruvbox-material-dark-hard
;                      :kanagawa :kanagawa-dragon})
;
; (fn setup [name]
;   (match name
;     :oxocarbon (do
;                  ;; (set-hl! 0 :StatusLine {:bg "#161616"})
;                  ;; (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
;                  (set-hl! 0 :Folded {:bg "#161616"})
;                  (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
;                  (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
;                  (set-hl! 0 :HopNextKey2 {:fg "#ee5396"})))
;   (when (and (. kitty-themes name) (vim.fn.executable :kitty))
;     (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
;                     (. kitty-themes name) :.conf))))
;
; (augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon))})
 (pack :projekt0n/github-nvim-theme {:lazy false})
 ; (pack :catppuccin/nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :catppuccin) :setup) {:color_overrides {:all {:base "#1e2b2e"
 ;                                                                             :mantle "#182225"
 ;                                                                             :crust "#121a1c"
 ;                                                                             :overlay0 "#6b7f85"
 ;                                                                             :overlay1 "#7d959b"
 ;                                                                             :overlay2 "#94adb3"
 ;                                                                             :surface0 "#314044"
 ;                                                                             :surface1 "#455559"
 ;                                                                             :surface2 "#586b6f"
 ;                                                                             :text "#cdf0f4"
 ;                                                                             :subtext1 "#badade"
 ;                                                                             :subtext0 "#a6c5c9"
 ;                                                                             :lavender "#b4b6fe"
 ;                                                                             :blue "#89cbfa"
 ;                                                                             :sapphire "#74deec"
 ;                                                                             :sky "#89ebe6"
 ;                                                                             :teal "#93e1da"
 ;                                                                             :green "#dae3a1"
 ;                                                                             :yellow "#f9e6ae"
 ;                                                                             :red "#f38e8c"
 ;                                                                             :marroon "#ea9f9e"
 ;                                                                             :mauve "#d1a6f7"
 ;                                                                             :pink "#f5c2da"
 ;                                                                             :flamingo "#f2d7ce"
 ;                                                                             :rosewater "#f5e6db"}}})
 ;                  (vim.cmd.colorscheme :catppuccin))})]
 ]
