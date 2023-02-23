(local {: ->str} (require :core.lib.types))
(local {: first : second} (require :core.lib.seq))
(local {: djb2} (require :core.lib.crypt))

(lambda expr->str [expr]
  `(string.gsub (macrodebug ,expr nil) "_%d+_auto" "#"))

(fn fn? [x]
  (and (list? x)
       (or (= `fn (first x)) (= `hashfn (first x)) (= `lambda (first x))
           (= `partial (first x)))))

(fn quoted? [x]
  (and (list? x) (= `quote (first x))))

(lambda quoted->fn [expr]
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (second expr)]
    `(fn [] ,non-quoted)))

(lambda quoted->str [expr]
  (assert-compile (quoted? expr) "expected quoted expression for expr" expr)
  (let [non-quoted (second expr)]
    (.. "'" (view non-quoted))))

(lambda expand-exprs [exprs]
  (if (> (length exprs) 1)
      `(do
         ,(unpack exprs))
      (first exprs)))

(lambda gensym-checksum [x ?options]
  (let [options (or ?options {})
        prefix (or options.prefix "")
        suffix (or options.subfix "")]
    (sym (.. prefix (djb2 (view x)) suffix))))

(lambda vlua [x]
  (assert-compile (sym? x) "expected symbol for x" x)
  (string.format "%v:lua.%s()" (->str x)))

{: expr->str
 : fn?
 : quoted?
 : quoted->fn
 : quoted->str
 : expand-exprs
 : gensym-checksum
 : vlua}
