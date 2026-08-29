(lambda set-attributes [thing attrs]
  (each [attr val (pairs attrs)]
    (tset thing attr val)))

(lambda make-basic-thing [?base ?attributes]
  "Make a basic thing."
  (let [thing (or ?base {})]
    (tset thing :set-attributes set-attributes)
    (when ?attributes (thing:set-attributes ?attributes))
    thing))

{: make-basic-thing}
