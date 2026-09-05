(lambda make-object [location ?base]
  "Return an object which now exists in LOCATION"
  (let [base (or ?base (basic-thing:make-basic-thing))
        dimension location.dimension
        object (dimension:make-thing base)]
    (lambda object.move [destination]
      (when object.location
        (object.location:remove object))
      (destination:receive object)
      (tset object.location destination))
    object))
