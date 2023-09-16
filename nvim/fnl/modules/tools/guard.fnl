(import-macros {: pack} :macros)

(pack :nvimdev/guard.nvim
      {:event [:BufReadPre :BufNewFile]
       :dependencies [:nvimdev/guard-collection]
       :config (fn []
                 (local ft (require :guard.filetype))
                 (: (ft "fennel,fnl") :fmt
                    {:cmd :fnlfmt :stdin true :args ["-"]})
                 (: (ft :python) :fmt :black)
                 (: (ft :lua) :fmt :stylua)
                 (: (ft "javascript,javascriptreact,typescript,typescriptreact,vue,css,scss,less,html,json,jsonc,yaml,markdown,markdown.mdx,graphql,handlebars")
                    :fmt :prettier)
                 (: (ft :rust) :fmt
                    {:cmd :rustfmt :stdin true :args [:--emit=stdout]})
                 (: (ft :go) :fmt {:cmd :gofumpt :stdin true :args []}) ; (: :lint ;    {:cmd :golangci-lint ;     :stdin true ;     :args [:run :--fix=false :--out-format=json]})
                 ((. (require :guard) :setup) {:fmt_on_save true
                                               :lsp_as_default_formatter false}))})
