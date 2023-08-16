(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(fn migrate-to-kitty [name]
  (local kitty-themes {:oxocarbon :oxocarbon
                       :gruvbox-material :gruvbox
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
                  (vim.cmd "TSDisable rainbow")))
  ;; kitty colorshcheme migration
  (migrate-to-kitty name))

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  ;(vim.cmd.colorscheme :oxocarbon)
                  )})
 (pack :savq/melange-nvim {:lazy false
                           :priority 999
                           ;; :config (fn [] (vim.cmd.colorscheme :melange))
                           })
 (pack :catppuccin/nvim {:lazy false
                         :config (fn []
                                   ((. (require :catppuccin) :setup) {:no_italic true
                                                                      :integrations {:hop true
                                                                                     :notify true
                                                                                     :treesitter_context true
                                                                                     :which_key true}
                                                                      :custom_highlights (fn [C]
                                                                                           {:Folded {:bg C.base}})
                                                                      :color_overrides {:macchiato {:base "#1b1b29"}
                                                                                        :mocha {:rosewater "#efc9c2"
                                                                                                :flamingo "#ebb2b2"
                                                                                                :pink "#F2A7DE"
                                                                                                :mauve "#b889f4"
                                                                                                :red "#EA7183"
                                                                                                :maroon "#EA838C"
                                                                                                :peach "#F39967"
                                                                                                :yellow "#EACA89"
                                                                                                :green "#96d382"
                                                                                                :teal "#78cec1"
                                                                                                :sky "#91d7e3"
                                                                                                :sapphire "#68bae0"
                                                                                                :blue "#739df2"
                                                                                                :lavender "#a0a8f6"
                                                                                                :text "#b5c1f1"
                                                                                                :subtext1 "#a6b0d8"
                                                                                                :subtext0 "#959ec2"
                                                                                                :overlay2 "#848cad"
                                                                                                :overlay1 "#717997"
                                                                                                :overlay0 "#63677f"
                                                                                                :surface2 "#505469"
                                                                                                :surface1 "#3e4255"
                                                                                                :surface0 "#2c2f40"
                                                                                                :base "#1a1c2a"
                                                                                                :mantle "#141620"
                                                                                                :crust "#0e0f16"}}})
                                   ;(vim.cmd.colorscheme :catppuccin-mocha)
                                   )})
 (pack :folke/tokyonight.nvim {:lazy false} :config
       (fn []
         ((. (require :tokyonight) :setup) {:style :night})))
 (pack :rebelot/kanagawa.nvim
       {:lazy false
        :config (fn []
                  ((. (require :kanagawa) :setup) {:transparent true
                                                   :colors {:theme {:all {:ui {:bg_gutter :none}}}}})
                  (vim.cmd.colorscheme :kanagawa))})
 (pack :rose-pine/neovim {:lazy false}
       (fn []
         ((. (require :rose-pine) :setup) {:disable_italics true})))
 (pack :embark-theme/vim {:lazy false
                          :config (fn []
                                    ((. (require :kanagawa) :setup) {:colors {:theme {:all {:ui {:bg_gutter :none}}}}})
                                    ; (vim.cmd.colorscheme :kanagawa-dragon)
                                    )})]


