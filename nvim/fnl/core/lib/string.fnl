(local {: ->bool} (require :core/lib/types))

(fn begins-with? [chars str]
  (->bool (str:match (.. "^" chars))))

{: begins-with?}
