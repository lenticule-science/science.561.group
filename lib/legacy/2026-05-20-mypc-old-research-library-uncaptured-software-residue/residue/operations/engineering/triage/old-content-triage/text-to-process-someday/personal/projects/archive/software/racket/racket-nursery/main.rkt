#lang racket

;; this code is meant to be interacted with in the REPL

;; first set up the catalog, where information about objects is kept
(define catalog (list))

;; then a history

(define history (list))

;; the history contains events, which are created by functions.

;; events create and modify records in the catalog



;; functions

;; (location ...)
;;
;; creates a record of a new 

(define (location
         #:id [id #f]
         #:parent [parent #f])
  (void))
(define (specimen
         #:id [id #f]
         #:location [location #f]
         #:names [names #f]
         #:events [events #f]
         #:cultivar [cultivar #f]
         #:patent [patent #f])
  (void))
(define (plan
         #:date [date #f]
         #:description [description #f])
  (void))

(define (observe
         #:id [id #f]
         #:date [date #f]
         #:description [description #f])
  (void))
(define (water
         #:id [id #f]
         #:date [date #f]
         #:description [description #f])
  (void))
(define (note
         #:name [name #f]
         #:note [note #f])
  (void))
(location
 #:id 'brick-box)

(location
 #:id '104-front-door
 #:parent 'brick-box)

(location
 #:id 'red-seed-company-pot
 #:parent '104-front-door)

(location
 #:id 'red-square-5in-pot
 #:parent '104-front-door)

(location
 #:id '6in-pot-0
 #:parent '104-front-door)

(location
 #:id 'iris-container
 #:parent 'maple-shaded-parking-spot)

(location
 #:id 'maple-shaded-parking-spot
 #:parent 'brick-box)

(specimen
 #:id 0
 #:names
 (make-hash
  (list
   (cons 'botanical "")))
 #:location 'foo)

(specimen
 #:id 1
 #:names
 (make-hash
  (list
   (cons 'botanical "Iris")
   (cons 'emsenn "Matt's Gift Iris")))
 #:location 'iris-container
 #:events
 (make-hash
  (list
   (cons "2020-04-12"
         (make-hash
          (list
           (cons 'evidentiality "memory, 2020-05-04")
           (cons 'type 'relocation)
           (cons 'details
                 (make-hash
                  (list
                   (cons 'origin "Coker Arboretum, UNC-Chapel Hill")
                   (cons 'destination 'iris-container)))))))
   (cons "2020-04-16"
         (make-hash
          (list
           (cons 'evidentiality "memory, 2020-05-04")
           (cons 'type 'bloom-start))))
   (cons "2020-04-22"
         (make-hash
          (list
           (cons 'evidentiality "memory, 2020-05-04")
           (cons 'type 'bloom-end)
           (cons 'details
                 (make-hash
                  (list
                   (cons 'blossoms 5))))))))))

(specimen
 #:id 2
 #:names
 (make-hash
  (list
   (cons 'botanical "Phlox stolonifera")
   (cons 'settler (list "creeping phlox" "moss phlox"))))
 #:location 'red-seed-company-pot
 #:events
 (make-hash
  (list
   (cons "2020-04-24"
         (make-hash
          (list
           (cons 'evidentiality "memory, 2020-05-04")
           (cons 'type 'relocation)
           (cons 'details
                 (make-hash
                  (list
                   (cons 'origin "Fifth Season Carrboro")
                   (cons 'destination 'red-seed-company-pot)))))))
   (cons "2020-05-03"
         (make-hash
          (list
           (cons 'evidentiality "observation")
           (cons 'type 'watering)
           (cons 'details
                 (make-hash
                  (list (cons 'notes "light")))))))
   (cons "2020-05-03"
         (make-hash
          (list
           (cons 'evidentiality "observation")
           (cons 'type 'observation)
           (cons 'details
                 (make-hash
                  (list (cons 'notes "yellowing on tallest growth, older leaves getting bigger"))))))))))


(specimen
 #:id 3
 #:names '((botanical "Monarda didyma")
           (settler "bee balm"))
 #:cultivar "Petite Delight"
 #:patent "PP#10,784"
 #:events
 '(("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-square-5in-pot)))))
   ("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type division)
     (details
      ((destination 6in-pot-0)))))
   ("2020-05-03"
    ((evidentiality "observation")
     (type watering)
     (details
      ((notes "light")))))))

(specimen
 #:id 4
 #:names '((botanical "Thymus serpyllum")
           (settler "red creeping thyme"))
 #:events
 '(("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 6in-pot-1)))))))


(specimen
 #:id 5
 #:names '((botanical "Mentha requienii")
           (settler "Corsican mint"))
 #:events
 '(("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 6in-pot-2)))))))

(specimen
 #:id 6
 #:names '((botanical "Melissa officinalis")
           (settler '("lemon balm" "balm mint")))
 #:events
 '(("2020-04-25"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Cindy & Rob's, west Durham")
       (destination 9in-pot-0)))))))

(specimen
 #:id 7
 #:names '((botanical "Monarda")
           (settler "bee balm"))
 #:events
 '(("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type division)
     (details
      ((origin red-square-5in-pot)))))))



(specimen
 #:id 8
 #:names '((botanical "Thymus")
           (settler "thyme"))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin south-fernando-bed)
       (destination 6in-pot-3)))))))


(specimen
 #:id 9
 #:names '((botanical "Monarda")
           (settler "bee balm"))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin south-fernando-bed)
       (destination 9in-pot-1)))))))
(specimen
 #:id 10
 #:names '((botanical "Monarda")
           (settler "bee balm"))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin south-fernando-bed)
       (destination 9in-pot-1)))))))
(specimen
 #:id 11
 #:names '((botanical ("Thymus pseudolanuginosus"
                       "Thymus praecox subsp. britannicus")
           (former-botanical "Thymus lanuginosus"))
           (settler "wooly thyme"))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 12in-windowbox)))))))

(specimen
 #:id 12
 #:names '((botanical "Monarda")
           (settler "bee balm"))
 #:events
 '(("2020-04-24"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination 6in-pot-4)))))))

(plan
 #:date "2020-05-04"
 #:description "Plant pole beans at the west edge of the mulberry/grape canopy, since that won't be pruned until next spring.")

(specimen
 #:id 13
 #:names '((botanical "Thymus")
           (settler "thyme"))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 6in-pot-5)))))))

(specimen
 #:id 14
 #:names '((botanical "Mentha spicata")
           (settler ("spearmint" "yerba buena")))
 #:events
 '(("2020-04-13"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin south-fernando-bed)
       (destination 6in-pot-6)))))))
(specimen
 #:id 15
 #:names '((botanical "Origanum vulgare 'Aureum'")
           (settler ("golden oregano")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 6in-pot-7)))))))

(specimen
 #:id 16
 #:names '((botanical "Thymus citriodorus ‘Archers Gold’")
           (settler ("Archer's gold thyme")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination 6in-pot-8)))))))
(specimen
 #:id 17
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))
(specimen
 #:id 18
 #:names '((botanical "Foeniculum vulgare 'Purpureum'")
           (settler ("bronze fennel")))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))
(specimen
 #:id 19
 #:names '((botanical "Coriandrum sativum")
           (settler ("coriander" "cilantro")))
 #:events
 '(("2020-04-12"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))
(specimen
 #:id 20
 #:names '((botanical "Phaseolus")
           (settler ("bean")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination red-16in-pot))))))

(specimen
 #:id 21
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))

(specimen
 #:id 22
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))

(specimen
 #:id 23
 #:names '((botanical "Anethum graveolens")
           (settler ("dill")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))


(specimen
 #:id 24
 #:names '((botanical "Helichrysum italicum")
           (settler ("curry plant" "immortelle")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))

(specimen
 #:id 25
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination red-16in-pot)))))))
(specimen
 #:id 26
 #:names '((botanical "Phaseolus")
           (settler ("bean")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination red-16in-pot))))))
(specimen
 #:id 27
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination pallet-1)))))))

(specimen
 #:id 28
 #:names '((botanical "Coriandrum sativum")
           (settler ("coriander" "cilantro")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination pallet-1)))))))
(specimen
 #:id 29
 #:names '((botanical "Phaseolus")
           (settler ("bean")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination pallet-1))))))
(specimen
 #:id 30
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination pallet-1)))))))

(specimen
 #:id 31
 #:names '((botanical "Capsicum annuum")
           (settler ("black Hungarian chili")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Danie, FNB919")
       (destination pallet-1)))))))


(specimen
 #:id 32
 #:names '((botanical "Fragaria × ananassa 'Rainbow Treasure'")
           (settler ("strawberry")))
 #:events
 '(("2020-04-26"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination pallet-1)))))))

(specimen
 #:id 33
 #:names '((botanical "Phaseolus")
           (settler ("bean")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination pallet-1))))))
(specimen
 #:id 34
 #:names '((botanical "Fragaria × ananassa 'Rainbow Treasure'")
           (settler ("strawberry")))
 #:events
 '(("2020-04-26"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Fifth Season Carrboro")
       (destination pallet-1)))))))






(specimen
 #:id 35
 #:names '((botanical "Solanum lycopersicum")
           (settler ("tomato")))
 #:events
 '(("2020-04-26"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination pallet-1)))))))


(specimen
 #:id 36
 #:names '((botanical "Fragaria × ananassa")
           (settler ("strawberry")))
 #:events
 '(("2020-04-29"
    ((evidentiality "memory, 2020-05-04")
     (type relocation)
     (details
      ((origin "Southern States Carrboro")
       (destination pallet-1)))))))

(specimen
 #:id 37
 #:names '((botanical "Phaseolus")
           (settler ("bean")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination pallet-1))))))

(specimen
 #:id 38
 #:names '((botanical "Ocimum basilicum")
           (settler ("sweet basil")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination pallet-1))))))


(specimen
 #:id 39
 #:names '((botanical "Cucurbita pepo")
           (settler ("zucchini")))
 #:events
 '(("2020-05-01"
    ((evidentiality "memory, 2020-05-04")
     (type planting)
     (details
       (destination pallet-1))))))

(observe
 #:id 2
 #:description "dry")

(water
 #:date "2020-05-05"
 #:id 2)

(water #:date "2020-05-05" #:id 3)

(note
 #:name "pink eye purplehull"
 #:note "Good for scatter/guerrilla gardening, since it throws its fruit upward. Place it back from walking paths and let it go.")

