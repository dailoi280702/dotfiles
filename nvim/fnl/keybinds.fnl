(import-macros {: map!} :macros)

;; telescope
(map! [n] :<leader><space> "<cmd>Telescope find_files<CR>"
      {:desc "Find file in project"})

(map! [n] "<leader>'" "<cmd>Telescope resume<CR>" {:desc "Resume last search"})
(map! [n] :<leader>. "<cmd>Telescope find_files<CR>" {:desc "Find file"})
(map! [n] "<leader>," "<cmd>Telescope file_browser initial_mode=normal<CR>"
      {:desc "Browse file"})

(map! [n] :<leader>/ "<cmd>Telescope live_grep<CR>" {:desc "Search in project"})
(map! [n] :<leader>> "<cmd>Telescope marks initial_mode=normal<CR>"
      {:desc "Show marks"})

(map! [n] "<leader>:" "<cmd>Telescope find_files<CR>" {:desc "Search commad"})
(map! [n] :<leader><tab> "<cmd>Telescope buffers initial_mode=normal<CR>"
      {:desc "Switch buffer"})

(map! [n] :<leader>! "<cmd>Telescope diagnostics<CR>"
      {:desc "Diagnostics picker"})

(map! [n] :<leader>< "<cmd>Telescope buffers<CR>" {:desc "Switch buffer"})

;; buffers
(map! [n] :<leader>bd :<cmd>bw<CR> {:desc "Delete buffer"})
(map! [n] :<leader>bD :<cmd>bw<CR> {:desc "Delete all buffers"})
(map! [n] :<leader>bs "<cmd>silent w<CR>" {:desc "Save buffer"})
(map! [n] :<leader>bS "<cmd>silent wa<CR>" {:desc "Save all buffers"})
(map! [n] :<leader>bb "<cmd>Telescope buffers<CR>" {:desc "Switch buffer"})
(map! [n] :<leader>by "<cmd>%y+<CR>" {:desc "Switch buffer"})

;; code
(map! [n] :<leader>ca `(vim.lsp.buf.code_action) {:desc "LSP code actions"})
; (map! [n] :<leader>cd `(vim.lsp.buf.definition)
;       {:desc "LSP jump to definition"})

(map! [n] :<leader>cd "<cmd>Telescope lsp_definitions<CR>"
      {:desc "LSP jump to definition"})

(map! [n] :<leader>ct "<cmd>Telescope lsp_type_definitions<CR>"
      {:desc "LSP jump to type definition"})

; (map! [n] :<leader>cD `(vim.lsp.buf.references)
;       {:desc "LSP jump to references"})
(map! [n] :<leader>cD "<cmd>Telescope lsp_references<CR>"
      {:desc "LSP jump to references"})

(map! [n] :<leader>cf `(vim.lsp.buf.format {:async true})
      {:desc "Format buffer"})

(map! [n] :<leader>ck `(vim.lsp.buf.hover) {:desc "LSP view documentation"})
(map! [n] :<leader>cr `(vim.lsp.buf.rename) {:desc "LSP rename"})
(map! [n] :<leader>ce `(vim.diagnostic.open_float)
      {:desc "Show line diagnostics"})

(map! [n] :<leader>cn `(vim.diagnostic.goto_next)
      {:desc "Go to next diagnostic"})

(map! [n] :<leader>cp `(vim.diagnostic.goto_pre)
      {:desc "Go to previous diagnostic"})

;;help
(map! [n] :<leader>hb "<cmd>Telescope keymaps<CR>" {:desc "List keybinds"})
(map! [n] :<leader>he :<cmd>messages<CR> {:desc "View message history"})
(map! [n] :<leader>hl :<cmd>messages<CR> {:desc "List command history"})
(map! [n] :<leader>hl "<cmd>Telescope notify<CR>" {:desc "Notify history"})
(map! [n] :<leader>hc :<cmd>checkhealth<CR> {:desc "Check Heath"})

;;jump
(map! [n] :<leader>jj :<cmd>HopWord<CR> {:desc "Jump to word"})
(map! [n] :<leader>jk :<cmd>HopWordMW<CR> {:desc "Jump to word in all panes"})
(map! [n] :<leader>jl :<cmd>HopLine<CR> {:desc "jump to line"})
(map! [n] :<leader>jk :<cmd>HopLineMW<CR> {:desc "Jump to line in all panes"})

;; open
(map! [n] :<leader>oi :<cmd>LspInfo<CR> {:desc "Lsp info"})
(map! [n] :<leader>ol :<cmd>Lazy<CR> {:desc :Lazy})
(map! [n] :<leader>om :<cmd>Mason<CR> {:desc :Mason})

;; toggle
(map! [n] :<leader>tn "<cmd>set nu!<CR>" {:desc "Toogle linenumber"})
(map! [n] :<leader>tr "<cmd>set rnu!<CR>" {:desc "Toogle relative linenumber"})
(map! [n] :<leader>tw "<cmd>set wrap!<CR>" {:desc "Toogle wrap"})
(map! [n] :<leader>tC "<cmd>set cursorline!<CR>" {:desc "Toogle cursorline"})
(map! [n] :<leader>tc :<cmd>ColorizerToggle<CR>
      {:desc "Toogle color hilighter"})

(map! [n] :<leader>tz :<cmd>NoNeckPain<CR> {:desc "Neck pain? press z"})
