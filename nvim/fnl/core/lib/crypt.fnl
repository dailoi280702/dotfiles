(fn djb2 [str]
  (let [bytes (icollect [char (str:gmatch ".")] (string.byte char))
        hash (accumulate [hash 5381 _ byte (ipairs bytes)]
               (+ byte hash (bit.lshift hash 5)))]
    (bit.tohex hash)))

{: djb2}
