#lang racket

(require "functions.rkt")

(define brick-box-community-room (make-location))

(receive #:date (date 0 30 12 19 5 2020 3 140 #f -5)
         #:giver "Weaver St Market, Carrboro"
         #:item "muffins, sweet potato, 4pk"
         #:quantity 4
         #:location brick-box-community-room)
(give #:date (date 0 40 17 19 5 2020 3 140 #f -5)
      #:item "muffins, sweet potato, 4pk"
      #:quantity 1
      #:location brick-box-community-room)

(receive-multiple-items
 #:date (date 0 30 12 19 5 2020 3 140 #f -5)
 #:location brick-box-community-room
 #:items
 '(("muffins, sweet potato, 4pk" . 2)))
