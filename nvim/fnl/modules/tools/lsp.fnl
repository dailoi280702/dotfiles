(import-macros {: pack} :macros)

(fn config []
  (local mason (require :mason))
  (local mason-lspconfig (require :mason-lspconfig))
  (local servers {:tsserver {}
                  :cssls {}
                  :html {}
                  :eslint {}
                  :ltex {}
                  :tailwindcss {}
                  :gopls {}
                  :lua_ls {}
                  :fennel_language_server {}
                  :rust_analyzer {}})
  (local tools [:prettierd
                :stylua
                :golangci-lint
                :gofumpt
                :eslint_d
                :fixjson
                :rust-analyzer])
  (local signs {:Error " " :Warn " " :Hint " " :Info " "})
  (each [dtype icon (pairs signs)]
    (let [hl (.. :DiagnosticSign dtype)]
      (vim.fn.sign_define hl {:text icon :texthl hl :numhl ""})))
  (vim.diagnostic.config {:underline true
                          :virtual_text {:spacing 4 :prefix " "}})
  (local lspconfig (require :lspconfig))
  (mason.setup)
  (let [mr (require :mason-registry)]
    (each [_ tool (ipairs tools)]
      (let [p (mr.get_package tool)]
        (when (not (p:is_installed))
          (p:install)))))
  (mason-lspconfig.setup {:ensure_installed ((fn []
                                               (var keys [])
                                               (each [key _ (pairs servers)]
                                                 (table.insert keys key))
                                               keys))})
  (local capabilities ((. (require :cmp_nvim_lsp) :default_capabilities)))
  (mason-lspconfig.setup_handlers {1 (fn [server_name]
                                       ((. (. (require :lspconfig) server_name)
                                           :setup) {: capabilities}))
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
                                                             (lspconfig.fennel_language_server.setup {}))}))

(pack :neovim/nvim-lspconfig {:event [:BufReadPre :BufNewFile]
                              :dependencies [:williamboman/mason.nvim
                                             :hrsh7th/cmp-nvim-lsp
                                             :williamboman/mason-lspconfig.nvim]
                              : config})
