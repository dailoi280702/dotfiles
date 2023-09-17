(import-macros {: pack} :macros)

(fn config []
  (local mason (require :mason))
  (local mason-lspconfig (require :mason-lspconfig))
  (local servers [:tsserver
                  :cssls
                  :html
                  :ltex
                  :tailwindcss
                  :gopls
                  :sqlls
                  ;; :ruff_lsp
                  :pyright
                  ;; :phpactor
                  :intelephense
                  :zls
                  :lua_ls
                  :bufls
                  :fennel_language_server
                  :golangci_lint_ls
                  :eslint
                  :rust_analyzer])
  (local tools [:prettierd
                :stylua
                :golangci-lint
                :gofumpt
                :eslint_d
                :fixjson
                :black
                ;; :ruff
                :rust-analyzer])
  ;; custom diagnostic signs
  (local signs {:Error " " :Warn " " :Hint " " :Info " "})
  (each [dtype icon (pairs signs)]
    (let [hl (.. :DiagnosticSign dtype)]
      (vim.fn.sign_define hl {:text icon :texthl hl :numhl ""})))
  (vim.diagnostic.config {:underline true
                          :virtual_text {:spacing 4 :prefix " "}})
  ;; :virtual_lines {:only_current_line true}
  ;; :virtual_text false})
  (local lspconfig (require :lspconfig))
  (mason.setup)
  ;; automatic insatll tools
  (let [mr (require :mason-registry)]
    (each [_ tool (ipairs tools)]
      (let [p (mr.get_package tool)]
        (when (not (p:is_installed))
          (p:install)))))
  ;; automatic install servers
  (mason-lspconfig.setup {:ensure_installed servers})
  ;; setup lsp servers
  (local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
  (set capabilities.textDocument.foldingRange
       {:dynamicRegistration false :lineFoldingOnly true})
  (mason-lspconfig.setup_handlers {1 (fn [server_name]
                                       ((. (. (require :lspconfig) server_name)
                                           :setup) {: capabilities}))
                                   :html (fn []
                                           (lspconfig.html.setup {: capabilities
                                                                  :filetypes [:html
                                                                              :php]}))
                                   ;; setup fennel
                                   :fennel_language_server (fn []
                                                             (tset (require :lspconfig.configs)
                                                                   :fennel_language_server
                                                                   {:default_config {:cmd [(.. (vim.fn.stdpath :data)
                                                                                               :/mason/packages/fennel-language-server/bin/fennel-language-server)]
                                                                                     :filetypes [:fennel]
                                                                                     :root_dir (lspconfig.util.root_pattern :fnl)
                                                                                     :settings {:fennel {:diagnostics {:globals [:vim]}
                                                                                                         :workspace {:library (vim.api.nvim_list_runtime_paths)}}}
                                                                                     :single_file_support true}})
                                                             (lspconfig.fennel_language_server.setup {: capabilities}))}))

(pack :neovim/nvim-lspconfig {:event [:BufReadPre :BufNewFile]
                              :dependencies [:williamboman/mason.nvim
                                             :hrsh7th/cmp-nvim-lsp
                                             :williamboman/mason-lspconfig.nvim]
                              : config})
