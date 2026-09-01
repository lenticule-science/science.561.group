(local data-handler (require :data-handler))
(local util (require :util))


(lambda make-log [?file-name ?name ?base]
  (let [name (or ?name :log)
        file-name (or ?file-name name)
        logger (data-handler.make-data-handler file-name name ?base)
        I (util.make-string-inserters name)]
    (tset logger (I.I :submit- :-entry)
          (lambda submit-log-entry [logger entry]
            (let [entries (: logger (I.P :load-))]
              (table.insert entries entry)
              (: logger (I.P :save-) entries))))
    logger))

{: make-log}
