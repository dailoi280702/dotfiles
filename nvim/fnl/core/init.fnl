(import-macros {: set! : let! : map! : set-mdls! : augroup! : autocmd!} :macros)

;; fnlfmt: skip
; (set-mdls! :tools
;            treesitter
;            lsp
;            guard
;            :completion
;            cmp
;            telescope
;            :ui
;            dashboard
;            gitsigns
;            ;lsp-lines
;            ;indent
;            statusline
;            noice
;            colorscheme
;            icons
;            :config
;            (default +smartparens +whichkey +motions)
;            :editor
;            color-hilighter
;            zen
;            fold)

;(set! number)
(set! updatetime 250)
(set! timeoutlen 400)
(set! conceallevel 2)
(set! signcolumn "yes:1")
(set! nowrap)
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)
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

;; (set! cursorline)
(set! nu)
(set! rnu)
(set! bri)
(let! mapleader " ")

(map! [n] :<esc> :<esc><cmd>noh<cr>)

(augroup! :IndentOnFileType
          (autocmd! FileType [html
                              javascript
                              javascriptreact
                              typescript
                              typescriptreact
                              yml]
                    "setlocal shiftwidth=2 tabstop=2 softtabstop=2"))
