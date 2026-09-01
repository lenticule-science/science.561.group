(local basic-thing (require :basic-thing))

(lambda make-folder [folder-name ?base]
  (let [folder (or ?base (basic-thing.make-basic-thing))]
    (print "FAFDA" folder)
    (folder:set-attributes {: folder-name})
    folder))

{: make-folder}
