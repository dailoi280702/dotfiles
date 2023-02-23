(import-macros {: pack : set!} :macros)
(set! completeopt [:menu :menuone :noselect])

(fn config []
  (local cmp (require :cmp))
  (local kind (require :lspkind))
  (local luasnip (require :luasnip))
  (cmp.setup {:snippet {:expand (fn [args]
                                  (luasnip.lsp_expand args.body))}
              :window {:completion {:col_offset (- 3)
                                    :side_padding 0
                                    :winhighlight "Normal:NormalFloat,NormalFloat:Pmenu,Pmenu:NormalFloat"}}
              :formatting {:fields {1 :kind 2 :abbr}
                           :format (fn [entry vim-item]
                                     (local kind
                                            (((. (require :lspkind) :cmp_format) {:maxwidth 50
                                                                                  :mode :symbol_text}) entry
                                                                                                                                                                                                      vim-item))
                                     (local strings
                                            (vim.split kind.kind "%s"
                                                       {:trimempty true}))
                                     (set kind.kind (.. " " (. strings 1) " "))
                                     kind)}
              :experimental {:ghost_text true}
              :sources (cmp.config.sources [{:name :nvim_lsp}
                                            {:name :luasnip}
                                            {:name :buffer}
                                            {:name :path}])
              :mapping {:<C-b> (cmp.mapping.scroll_docs -4)
                        :<C-f> (cmp.mapping.scroll_docs 4)
                        :<C-Space> (cmp.mapping.complete)
                        :<C-n> (cmp.mapping.select_next_item)
                        :<C-p> (cmp.mapping.select_prev_item)
                        :<CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.replace
                                                    :select true})
                        :<Tab> (cmp.mapping (fn [fallback]
                                              (if (cmp.visible)
                                                  (cmp.select_next_item)
                                                  (luasnip.expand_or_jumpable)
                                                  (luasnip.expand_or_jump)
                                                  (fallback)))
                                            [:i :c :s])
                        :<S-Tab> (cmp.mapping (fn [fallback]
                                                (if (cmp.visible)
                                                    (cmp.select_prev_item)
                                                    (luasnip.expand_or_jumpable -1)
                                                    (luasnip.expand_or_jump -1)
                                                    (fallback)))
                                              [:i :c :s])}})
  (cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline)
                          :sources [{:name :buffer}]})
  (cmp.setup.cmdline ":"
                     {:mapping (cmp.mapping.preset.cmdline)
                      :sources [{:name :path} {:name :cmdline}]}))

(pack :hrsh7th/nvim-cmp {:event :InsertEnter
                         :dependencies [:hrsh7th/cmp-buffer
                                        :hrsh7th/cmp-path
                                        :hrsh7th/cmp-cmdline
                                        (pack :L3MON4D3/LuaSnip
                                              {:config (fn []
                                                         (. (require :luasnip.loaders.from_vscode)
                                                            :lazy_load))})
                                        :rafamadriz/friendly-snippets
                                        :saadparwaiz1/cmp_luasnip
                                        :onsails/lspkind.nvim]
                         : config})
