(local {: ->str : nil? : str? : num?} (require :core.lib.types))

(local {: begins-with?} (require :core.lib.string))
(local {: first : all?} (require :core.lib.seq))
(local {: quoted?
        : fn?
        : quoted->fn
        : quoted->str
        : gensym-checksum
        : expand-exprs
        : vlua} (require :core.lib.compile-time))

(tset _G :custom/modules [])

(lambda set! [name ?value]
  (assert-compile (sym? name) "expected symbol for name" name)
  (let [name (->str name)
        value (if (nil? ?value)
                  (not (begins-with? :no name))
                  ?value)
        value (if (quoted? value)
                  (quoted->fn value)
                  value)
        name (if (and (nil? ?value) (begins-with? :no name))
                 (name:match "^no(.+)$")
                 name)
        exprs (if (fn? value)
                  [`(tset _G ,(->str (gensym-checksum value {:prefix "__"}))
                          ,value)]
                  [])
        value (if (fn? value)
                  (vlua (gensym-checksum value {:prefix "__"}))
                  value)
        exprs (doto exprs
                (table.insert (match (name:sub -1)
                                "+" `(: (. vim.opt ,(name:sub 1 -2)) :append
                                        ,value)
                                :0 `(: (. vim.opt ,(name:sub 1 -2)) :remove
                                       ,value)
                                "^" `(: (. vim.opt ,(name:sub 1 -2)) :prepends
                                        ,value)
                                "?" `(: (. vim.opt ,(name:sub 1 -2)) :get)
                                _ `(tset vim.opt ,name ,value))))]
    (expand-exprs exprs)))

(lambda let-with-scope! [[scope] name value]
  (assert-compile (or (str? scope) (sym? scope))
                  "expected string or symbol for scope" scope)
  (assert-compile (or (= :b (->str scope)) (= :w (->str scope))
                      (= :t (->str scope)) (= :g (->str scope)))
                  "expected scope to be either b, w, t or g" scope)
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (let [name (->str name)
        scope (->str scope)]
    `(tset ,(match scope
              :b `vim.b
              :w `vim.b
              :t `vim.b
              :g `vim.g) ,name ,value)))

(lambda let-global! [name value]
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (let [name (->str name)]
    `(tset vim.g ,name ,value)))

(lambda let! [...]
  (match [...]
    [[scope] name value] (let-with-scope! [scope] name value)
    [name value] (let-global! name value)
    _ (error "expected let! to have at least two arguments: name value")))

(lambda set-hl! [ns_id name ?val]
  (assert-compile (num? ns_id) "expected number for ns_id" ns_id)
  (assert-compile (str? name) "expected string for name" name)
  (assert-compile (or (nil? ?val) (table? ?val)) "expected table for val" ?val)
  (let [val (or ?val {})]
    `(vim.api.nvim_set_hl ,ns_id ,name ,val)))

(lambda map! [[modes] lhs rhs ?options]
  (assert-compile (sym? modes) "expected symbol for modes" modes)
  (assert-compile (str? lhs) "expected string for lhs" lhs)
  (assert-compile (or (str? rhs) (sym? rhs) (fn? rhs) (quoted? rhs))
                  "expected string, symbol, function or quoted expression for rhs"
                  lhs)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options" ?options)
  (let [modes (icollect [char (string.gmatch (->str modes) ".")]
                char)
        options (or ?options {})
        options (if (nil? options.desc)
                    (doto options
                      (tset :desc
                            (if (quoted? rhs) (quoted->str rhs)
                                (str? rhs) rhs
                                (view rhs))))
                    options)
        rhs (if (quoted? rhs) (quoted->fn rhs) rhs)]
    `(vim.keymap.set ,modes ,lhs ,rhs ,options)))

(lambda autocmd! [event pattern command ?options]
  (assert-compile (or (sym? event) (and (table? event) (all? #(sym? $) event)))
                  "expected symbol or list of symbols for event" event)
  (assert-compile (or (sym? pattern)
                      (and (table? pattern) (all? #(sym? $) pattern)))
                  "expected symbol or list of symbols for pattern" pattern)
  (assert-compile (or (str? command) (fn? command) (sym? command)
                      (quoted? command))
                  "expected string, function, symnbol or quoted expresstion for command"
                  command)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options" ?options)
  (let [event (if (table? event) (icollect [_ v (ipairs event)] (->str v))
                  (->str event))
        pattern (if (table? pattern)
                    (icollect [_ v (ipairs pattern)] (->str v))
                    (->str pattern))
        options (or ?options {})
        options (if (nil? options.buffer)
                    (if (= pattern :<buffer>)
                        (doto options (tset :buffer 0))
                        (doto options (tset :pattern pattern)))
                    options)
        options (if (str? command)
                    (doto options (tset :command command))
                    (doto options
                      (tset :callback
                            (if (quoted? command) (quoted->fn command) command))))
        options (if (nil? options.desc)
                    (doto options
                      (tset :desc
                            (if (quoted? command) (quoted->str command)
                                (str? command) command
                                (view command))))
                    options)]
    `(vim.api.nvim_create_autocmd ,event ,options)))

(lambda augroup! [name ...]
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (assert-compile (all? #(and (list? $)
                              (or (= `clear! (first $)) (= `autocmd! (first $))))
                        [...])
                  "expected autocmd exprs for body" ...)
  (expand-exprs (let [name (->str name)]
                  (icollect [_ expr (ipairs [...])
                             &into [`(vim.api.nvim_create_augroup ,name
                                                                  {:clear false})]]
                    (if (= `autocmd! (first expr))
                        (let [[_ event pattern command ?options] expr
                              options (or ?options {})
                              options (doto options (tset :group name))]
                          `(autocmd! ,event ,pattern ,command ,options))
                        (let [[_ ?options] expr]
                          `(clear! ,name ,?options)))))))

(lambda clear! [name ?options]
  (assert-compile (or (str? name) (sym? name))
                  "expected string or symbol for name" name)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options" ?options)
  (let [name (->str name)
        options (or ?options {})
        options (doto options (tset :group name))]
    `(vim.api.nvim_clear_autocmds ,options)))

(lambda pack [identifier ?options]
  (assert-compile (str? identifier) "expected string for identifier" identifier)
  (assert-compile (or (nil? ?options) (table? ?options))
                  "expected table for options" ?options)
  (let [options (or ?options {})
        options (collect [k v (pairs options)]
                  (match k
                    :require* (values :config `#(require ,v))
                    _ (values k v)))]
    (doto options (tset 1 identifier))))

(lambda set-mdls! [...]
  (var moduletag nil)
  (var registry [])

  (fn register-module [name]
    (if (str? name)
        (set moduletag name)
        (if (sym? name)
            (let [name (->str name)
                  include-path (.. :.modules. moduletag "." name)]
              (table.insert registry include-path))
            (let [modulename (->str (first name))
                  include-path (.. :.modules. moduletag "." modulename)
                  [_ & flags] name]
              (icollect [_ flag (ipairs flags) &into registry]
                (.. include-path "." (->str flag)))))))

  (fn register-modules [...]
    (each [_ mod (ipairs [...])]
      (register-module mod))
    registry)

  (let [modules (register-modules ...)]
    (tset _G :custom/modules modules)))

(lambda get-mdls! []
  (icollect [_ mod (ipairs _G.custom/modules)]
    `(require ,mod)))

{: set!
 : let!
 : map!
 : set-hl!
 : autocmd!
 : augroup!
 : clear!
 : pack
 : get-mdls!
 : set-mdls!}

