(local basic-thing (require :basic-thing))
(local util (require :util))



(lambda make-data-handler [?file-name ?name ?base ?default]
  (let [handler (or ?base (basic-thing.make-basic-thing))
        name (or ?name :data)
        name-file (.. name :-file)
        file (if (. handler :folder-name)
                 (.. handler.folder-name "/" name)
                 name)
        default (or ?default nil)
        I (util.make-string-inserters name)]
    (handler:set-attributes
     {name-file file
      (I.P :load-) (lambda load-data [handler ?file ?default]
                     (util.load-data (or ?file (. handler name-file))
                                     (or ?default default)))
      (I.P :save-) (lambda save-data [handler data ?file]
                     (util.save-data data (or ?file (. handler name-file))))})
    handler))

{: make-data-handler}
