(local basic-thing (require :basic-thing))


(lambda add-thing [maker thing]
  (table.insert maker.things thing))
(lambda make-thing [maker ?attributes]
  (let [thing (basic-thing:make-basic-thing nil ?attributes)]
    (maker:add-thing thing)
    (set thing.maker maker)
    thing))
(lambda make-maker [?base]
  (let [maker (or ?base (basic-thing.make-basic-thing))]
    (maker:set-attributes
     {:things []
      :add-thing add-thing
      :make-thing make-thing})
    maker))

{: make-maker}
