(import-macros {: pack : set-hl!} :macros)

[(pack :nyoom-engineering/oxocarbon.nvim
       {:lazy false
        :priority 1000
        :config (fn []
                  (vim.cmd.colorscheme :oxocarbon)
                  (set-hl! 0 :StatusLine {:bg "#161616"})
                  (set-hl! 0 :StatusLineNC {:bg "#161616" :fg "#161616"})
                  (set-hl! 0 :Folded {:bg "#161616"})
                  (set-hl! 0 :HopNextKey {:fg "#be95ff" :bold true})
                  (set-hl! 0 :HopNextKey1 {:fg "#ff7eb6" :bold true})
                  (set-hl! 0 :HopNextKey2 {:fg "#ee5396"}))})
 (pack :Mofiqul/vscode.nvim {:lazy false})
 (pack :Mofiqul/dracula.nvim {:lazy false})
 (pack :jerryaugusto/dracula_pro.nvim {:lazy false})]
