; (import-macros {: pack : autocmd! : augroup!} :macros)
(import-macros {: pack} :macros)

; (augroup! :OpenTelescopeOnSTartup
;           (autocmd! VimEnter * "Telescope find_files previewer=false"))

(fn config []
  (local telescope (require :telescope))
  (telescope.setup {:defaults {; :prompt_prefix "   "
                               :prompt_prefix "   "
                               :selection_caret "  "
                               :entry_prefix "  "
                               :sorting_strategy :ascending
                               :layout_strategy :flex
                               :layout_config {:horizontal {:prompt_position :top
                                                            :preview_width 0.55}
                                               :vertical {:mirror false
                                                          :prompt_position :top}
                                               :width 0.9
                                               :height 0.8
                                               :preview_cutoff 110}
                               :set_env {:COLORTERM :truecolor}
                               :dynamic_preview_title true}})
  (telescope.load_extension :file_browser)
  ;; (telescope.load_extension :fzf)
  )

(pack :nvim-telescope/telescope.nvim
      {:cmd :Telescope
       :dependencies [:nvim-telescope/telescope-file-browser.nvim
                      :nvim-lua/plenary.nvim
                      ; (pack :nvim-telescope/telescope-fzf-native.nvim
                      ;       {:build :make})
                      ]
       : config})
