(local basic-thing (require :basic-thing))
(local data-handler (require :data-handler))
(local util (require :util))

(lambda make-dictionary [?file-name ?name ?base]
  "Return a dictionary, a data-handler whose data is a dictionary of keys and values"
  (let [name (or ?name :dictionary)
        file-name (or ?file-name name)
        dictionary (data-handler.make-data-handler
                    file-name name
                    (or ?base (basic-thing.make-basic-thing))
                    [])
        I (util.make-string-inserters name)]
    (tset dictionary (I.I :submit- :-item)
          (lambda submit-dictionary-item [dictionary id item]
            (let [items (: dictionary (I.P :load-))]
              (tset items id item)
              (: dictionary (I.P :save-) items))))
    dictionary))

{: make-dictionary}
