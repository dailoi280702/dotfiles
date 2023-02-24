(import-macros {: pack} :macros)

(fn config []
  (local conditions (require :heirline.conditions))
  (local utils (require :heirline.utils))
  (local Terminal-name {:hl {:bold true :fg :blue}
                        :provider (fn []
                                    (local (tname _)
                                           (: (vim.api.nvim_buf_get_name 0)
                                              :gsub ".*:" ""))
                                    (.. " " tname))})
  (local Help-file-name
         {:condition (fn [] (= vim.bo.filetype :help))
          :hl {:fg :blue}
          :provider (fn [] (local filename (vim.api.nvim_buf_get_name 0))
                      (vim.fn.fnamemodify filename ":t"))})
  (local File-type
         {:hl {:bold true :fg (. (utils.get_highlight :Type) :fg)}
          :provider (fn [] (string.upper vim.bo.filetype))})
  (local Search-count
         {:condition (fn [] (and (not= vim.v.hlsearch 0) (= vim.o.cmdheight 0)))
          :init (fn [self] (local (ok search) (pcall vim.fn.searchcount))
                  (when (and ok search.total) (set self.search search)))
          :provider (fn [self] (local search self.search)
                      (string.format "[%d/%d]" search.current
                                     (math.min search.total search.maxcount)))})
  (var File-name-block
       {:init (fn [self] (set self.filename (vim.api.nvim_buf_get_name 0)))})
  (local File-icon
         {:hl (fn [self] {:fg self.icon_color})
          :init (fn [self]
                  (local filename self.filename)
                  (local extension (vim.fn.fnamemodify filename ":e"))
                  (set (self.icon self.icon_color)
                       ((. (require :nvim-web-devicons) :get_icon_color) filename
                                                                         extension
                                                                         {:default true})))
          :provider (fn [self] (and self.icon (.. " " self.icon)))})
  (local File-name {:hl {:fg (. (utils.get_highlight :Directory) :fg)}
                    :provider (fn [self]
                                (var filename
                                     (vim.fn.fnamemodify self.filename ":."))
                                (when (= filename "")
                                  (lua "return \"[No Name]\""))
                                (when (not (conditions.width_percent_below (length filename)
                                                                           0.25))
                                  (set filename (vim.fn.pathshorten filename)))
                                (.. " " filename))})
  (local File-flags [{:condition (fn [] vim.bo.modified)
                      :hl {:fg :green}
                      :provider "[+]"}
                     {:condition (fn []
                                   (or (not vim.bo.modifiable) vim.bo.readonly))
                      :hl {:fg :orange}
                      :provider ""}])
  (local File-name-modifer
         {:hl (fn [] (when vim.bo.modified {:bold true :fg :cyan :force true}))})
  (set File-name-block
       (utils.insert File-name-block (utils.insert File-name-modifer File-name)
                     File-flags File-icon {:provider "%<"}))
  (local Git
         {1 {:hl {:bold true}
             :provider (fn [self] (.. "  " self.status_dict.head))}
          2 {:condition (fn [self] self.has_changes) :provider "("}
          3 {:hl {:fg :git_add}
             :provider (fn [self] (local count (or self.status_dict.added 0))
                         (and (> count 0) (.. "+" count)))}
          4 {:hl {:fg :git_del}
             :provider (fn [self]
                         (local count (or self.status_dict.removed 0))
                         (and (> count 0) (.. "-" count)))}
          5 {:hl {:fg :git_change}
             :provider (fn [self]
                         (local count (or self.status_dict.changed 0))
                         (and (> count 0) (.. "~" count)))}
          6 {:condition (fn [self] self.has_changes) :provider ")"}
          :condition conditions.is_git_repo
          :hl {:fg :purple}
          :init (fn [self]
                  (set self.status_dict vim.b.gitsigns_status_dict)
                  (set self.has_changes
                       (or (or (not= self.status_dict.added 0)
                               (not= self.status_dict.removed 0))
                           (not= self.status_dict.changed 0))))})
  (local Diagnostics
         {1 {:provider " "}
          2 {:hl {:fg :diag_error}
             :provider (fn [self]
                         (and (> self.errors 0)
                              (.. self.error_icon self.errors " ")))}
          3 {:hl {:fg :diag_warn}
             :provider (fn [self]
                         (and (> self.warnings 0)
                              (.. self.warn_icon self.warnings " ")))}
          4 {:hl {:fg :diag_info}
             :provider (fn [self]
                         (and (> self.info 0) (.. self.info_icon self.info " ")))}
          5 {:hl {:fg :diag_hint}
             :provider (fn [self]
                         (and (> self.hints 0)
                              (.. self.hint_icon self.hints " ")))}
          :condition conditions.has_diagnostics
          :init (fn [self]
                  (set self.errors
                       (length (vim.diagnostic.get 0
                                                   {:severity vim.diagnostic.severity.ERROR})))
                  (set self.warnings
                       (length (vim.diagnostic.get 0
                                                   {:severity vim.diagnostic.severity.WARN})))
                  (set self.hints
                       (length (vim.diagnostic.get 0
                                                   {:severity vim.diagnostic.severity.HINT})))
                  (set self.info
                       (length (vim.diagnostic.get 0
                                                   {:severity vim.diagnostic.severity.INFO}))))
          :static {:error_icon " "
                   :hint_icon " "
                   :info_icon " "
                   :warn_icon " "}
          :update [:DiagnosticChanged :BufEnter]})
  (local Ruler {:provider "%7(%l/%L%):%c %P"})
  (local Scroll-bar {:hl {:fg :blue}
                     :provider (fn [self]
                                 (local curr-line
                                        (. (vim.api.nvim_win_get_cursor 0) 1))
                                 (local lines (vim.api.nvim_buf_line_count 0))
                                 (local i
                                        (+ (math.floor (* (/ (- curr-line 1)
                                                             lines)
                                                          (length self.sbar)))
                                           1))
                                 (string.rep (.. (. self.sbar i) " ") 1))
                     :static {:sbar [""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""
                                     ""]}})
  (local Vi-mode {:hl (fn [self] (local mode (self.mode:sub 1 1))
                        {:bold true :fg (. self.mode_colors mode)})
                  :init (fn [self]
                          (set self.mode (vim.fn.mode 1))
                          (when (not self.once)
                            (vim.api.nvim_create_autocmd :ModeChanged
                                                         {:command :redrawstatus
                                                          :pattern "*:*o"})
                            (set self.once true)))
                  :provider (fn [self]
                              (.. " " (. self.mode_icons (self.mode:sub 1 1))
                                  "%)%2(" (. self.mode_names self.mode) "%) "))
                  :static {:mode_colors {"\019" :orange
                                         "\022" :cyan
                                         :! :red
                                         :R :purple
                                         :S :orange
                                         :V :cyan
                                         :c :purple
                                         :i :green
                                         :n :red
                                         :r :purple
                                         :s :orange
                                         :t :red
                                         :v :cyan}
                           :mode_icons {"\019" " "
                                        "\022" " "
                                        :! " "
                                        :R " "
                                        :S " "
                                        :V " "
                                        :c " "
                                        :i "󰙏 "
                                        :n " "
                                        :r " "
                                        :s " "
                                        :t " "
                                        :v " "}
                           :mode_names {"\019" :^S
                                        "\022" :^V
                                        "\022s" :^V
                                        :! "!"
                                        :R :R
                                        :Rc :Rc
                                        :Rv :Rv
                                        :Rvc :Rv
                                        :Rvx :Rv
                                        :Rx :Rx
                                        :S :S_
                                        :V :V_
                                        :Vs :Vs
                                        :c :C
                                        :cv :Ex
                                        :i :I
                                        :ic :Ic
                                        :ix :Ix
                                        :n :N
                                        :niI :Ni
                                        :niR :Nr
                                        :niV :Nv
                                        :no :N?
                                        "no\022" :N?
                                        :noV :N?
                                        :nov :N?
                                        :nt :Nt
                                        :r "..."
                                        :r? "?"
                                        :rm :M
                                        :s :S
                                        :t :T
                                        :v :V
                                        :vs :Vs}}
                  :update [:ModeChanged]})
  (local colors {:blue "#82cfff"
                 :bright_bg "#262626"
                 :bright_fg "#525252"
                 :cyan "#3ddbd9"
                 :dark_red "#ee5396"
                 :diag_error "#ee5396"
                 :diag_hint "#78a9ff"
                 :diag_info "#dde1e6"
                 :diag_warn "#3ddbd9"
                 :git_add "#08bdba"
                 :git_change "#78a9ff"
                 :git_del "#ee5396"
                 :gray "#525252"
                 :green "#42be65"
                 :orange ""
                 :purple "#be95ff"
                 :red "#ff7eb6"
                 :subtext1 "#525252"})
  ((. (require :heirline) :load_colors) colors)
  (local Space {:provider " "})
  (local Align {:provider "%="})
  (local Break {:provider "%<"})
  (local Default-statusline [Vi-mode
                             Git
                             Space
                             Diagnostics
                             File-name-block
                             Break
                             Align
                             Search-count
                             Ruler
                             Space
                             Scroll-bar])
  (local Inactive-statusline
         {1 File-name-block
          2 Align
          3 Ruler
          4 Space
          :condition conditions.is_not_active
          :hl {:fg :subtext1 :force true}})
  (local Terminal-statusline
         {1 {1 Vi-mode 2 Space :condition conditions.is_active}
          2 File-type
          3 Space
          4 Terminal-name
          5 Align
          :condition (fn []
                       (conditions.buffer_matches {:buftype [:terminal]}))})
  (local Special-statusline
         {1 Space
          2 File-type
          3 Space
          4 Help-file-name
          5 Align
          6 Search-count
          7 Ruler
          8 Space
          9 Scroll-bar
          :condition (fn []
                       (conditions.buffer_matches {:buftype [:nofile
                                                             :prompt
                                                             :help
                                                             :quickfix]
                                                   :filetype [:^git.*
                                                              :fugitive]}))})
  (local Dashboard-statusline {:condition (fn []
                                            (= vim.bo.filetype :alpha))
                               1 Align
                               2 {:provider "fuck you, keep going"
                                  :h {:fg :subtext1}}
                               3 Align})
  (local Noneckpain-statusline
         {:condition (fn []
                       (= vim.bo.filetype :no-neck-pain))})
  (local Status-lines {1 Dashboard-statusline
                       2 Noneckpain-statusline
                       3 Special-statusline
                       4 Terminal-statusline
                       5 Inactive-statusline
                       6 Default-statusline
                       :fallthrough false
                       :hl (fn []
                             (if (conditions.is_active) :StatusLine
                                 :StatusLineNC))})
  ((. (require :heirline) :setup) {:statusline Status-lines}))

(pack :rebelot/heirline.nvim {:event [:VeryLazy] : config})
