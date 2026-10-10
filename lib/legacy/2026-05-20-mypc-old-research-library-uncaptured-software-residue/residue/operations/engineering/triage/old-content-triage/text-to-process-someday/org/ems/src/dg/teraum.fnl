(let [basic-thing (require :basic-thing)
      dimension (require :dimension)
      folder (require :folder)
      map (require :map)
      mud-server (require :mud-server)
      teraum (mud-server.make-mud-server
              nil
              (map.make-map
               nil nil
               (dimension.make-dimension
                (folder.make-folder
                 :teraum
                 (basic-thing.make-basic-thing
                  {:name :Teraum
                   :spawn-room :d6cce35c})))))]
  teraum)
