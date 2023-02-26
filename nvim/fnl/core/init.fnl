(import-macros {: set! : let! : map! : set-mdls!} :macros)

(set-mdls! :tools treesitter lsp null-ls :completion cmp telescope :ui
           dashboard gitsigns lsp-lines indent statusline noice colorscheme
           icons :config (default +smartparens +whichkey +motions) :editor zen
           fold)

;(set! number)
(set! updatetime 250)
(set! timeoutlen 400)
(set! conceallevel 2)
(set! signcolumn "yes:1")
(set! nowrap)
(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! cmdheight 0)
(set! expandtab)
(set! noswapfile)
(set! nobackup)
(set! nowb)
(set! noshowmode)
(set! clipboard :unnamedplus)
(set! hlsearch)
(set! ignorecase)
(set! smartcase)
(set! scrolloff 10)
(set! sidescrolloff 10)
(set! mouse :n)
(set! mousemodel :extend)
(set! fillchars {:eob " "
                 :vert " "
                 :horiz " "
                 :diff "╱"
                 :foldclose ""
                 :foldopen ""
                 :fold " "
                 :msgsep "─"})

;(set! cursorline)
(set! bri)
(let! mapleader " ")

(map! [n] :<esc> :<esc><cmd>noh<cr>)
