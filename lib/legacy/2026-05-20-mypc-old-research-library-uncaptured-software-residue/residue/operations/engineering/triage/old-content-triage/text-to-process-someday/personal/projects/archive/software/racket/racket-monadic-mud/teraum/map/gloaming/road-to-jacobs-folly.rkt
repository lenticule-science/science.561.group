#lang racket

(require "./recipes.rkt")

(provide road-to-jacobs-folly)

(define road-to-jacobs-folly
  (rural-road
   #:name "road to Jacob's Folly"
   #:description "This is a thin path in the Gloaming, leading from the Longroad to Jacob's Folly."
   #:exits '((east . gloaming/jacobs-folly/outside)
             (southwest . gloaming/south-longroad))))