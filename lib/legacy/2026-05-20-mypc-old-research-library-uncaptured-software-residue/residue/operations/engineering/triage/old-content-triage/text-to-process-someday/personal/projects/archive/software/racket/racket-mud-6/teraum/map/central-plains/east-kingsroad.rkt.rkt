#lang racket

(require "./recipes.rkt")

(provide east-kingsroad)
(define east-road
  (rural-road
   #:name "road between the Central Plains and Farsteppes"
   #:description "This is the road between the Central Plains and the Farsteppes."
   #:exits '((east . farsteppes/central-plains-road)
             (west . central-plains/fort-kelly))))
