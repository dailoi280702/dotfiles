(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(local kitty-themes {:oxocarbon :oxocarbon
                     :gruvbox-material :gruvbox-material-dark-hard
                     :solarized :solarzied-dark
                     :kanagawa :kanagawa-dragon})

(fn setup [name]
  (match name
    :oxocarbon (do
                 ;; (set-hl! 0 :StatusLine {:bg "#161616"})
                 ;; (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                 (set-hl! 0 :Folded {:bg "#161616"})
                 (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                 (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                 (set-hl! 0 :HopNextKey2 {:fg "#ee5396"})))
  (when (and (. kitty-themes name) (vim.fn.executable :kitty))
    (os.execute (.. "kitty @ --to $KITTY_LISTEN_ON set-colors ~/.config/kitty/themes/"
                    (. kitty-themes name) :.conf))))

(augroup! :SetupColorscheme (autocmd! ColorScheme * `(setup vim.g.colors_name)))

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon))})
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
 ; (pack :Mofiqul/vscode.nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :vscode) :setup) {:transparent true})
 ;                  ((. (require :vscode) :load)))})
 ; (pack :catppuccin/nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :catppuccin) :setup) {})
 ;                  (vim.cmd.colorscheme :catppuccin))})
 ]
