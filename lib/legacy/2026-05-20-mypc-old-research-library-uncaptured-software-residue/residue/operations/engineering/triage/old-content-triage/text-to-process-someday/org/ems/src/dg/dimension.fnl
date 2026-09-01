(local timer (require :timer))
(local maker (require :maker))
(local basic-thing (require :basic-thing))

(lambda make-dimension [?base]
  "Turns ?BASE (or a new basic thing) into a dimension, which is a timer and maker combined."
  (let [dimension (or ?base (basic-thing.make-basic-thing))]
    (when (not dimension.dimension)
      (set dimension.dimension dimension))
    (when (not dimension.schedule-event) (timer.make-timer dimension))
    (when (not dimension.make-thing) (maker.make-maker dimension))
    (let [old-make-thing dimension.make-thing]
      (lambda dimension.make-thing [dimension ?attributes]
        (let [thing (old-make-thing dimension ?attributes)]
          (set thing.dimension dimension)
          thing)))
    dimension))

{: make-dimension}
