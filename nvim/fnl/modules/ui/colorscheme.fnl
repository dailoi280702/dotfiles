(import-macros {: pack : set-hl! : autocmd! : augroup!} :macros)

(local kitty-themes {:oxocarbon :oxocarbon
                     :gruvbox-material :gruvbox-material-dark-hard
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
 ; (pack :catppuccin/nvim
 ;       {:lazy false
 ;        :config (fn []
 ;                  ((. (require :catppuccin) :setup) {})
 ;                  (vim.cmd.colorscheme :catppuccin))})
 ]
