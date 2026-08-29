(local basic-thing (require :basic-thing))
(local dictionary (require :dictionary))
(local util (require :util))

(lambda make-map [?file ?name ?base]
  (let [name (or ?name :map)
        base (or ?base (basic-thing.make-basic-thing))
        f (or ?file name)
        file (if (. base :folder)
                 (.. base.folder "/" f)
                 f)
        map (dictionary.make-dictionary file name base)
        I (util.make-string-inserters name)]
    (tset map (I.I :make- :-item)
          (lambda make-map-item [map name]
            {:name name}))
    (tset map (I.I :submit- :-item)
          (lambda submit-map-item [map entry]
            (let [areas (: map (I.P :load-))
                  area-keys (util.collect-keys areas)
                  area-id (util.make-id area-keys)
                  area {area-id entry}]
              (tset areas area-id entry)
              (: map (I.P :save-) areas)
              area)))
    map))

{: make-map}
