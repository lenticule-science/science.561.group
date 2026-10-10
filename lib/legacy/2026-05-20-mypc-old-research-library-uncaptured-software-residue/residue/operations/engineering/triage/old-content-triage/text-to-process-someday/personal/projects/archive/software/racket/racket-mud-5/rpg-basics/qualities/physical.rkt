#lang racket

(require "../../mud/engine.rkt")
(require "../../mud/thing.rkt")

(provide physical
         physical-location
         set-physical-location!
         physical-mass
         set-physical-mass!
         add-mass)

(struct physical-attributes (location mass) #:mutable)

(define (apply-physical-quality thing) (void))

(define (physical location mass)
  (quality apply-physical-quality
           (physical-attributes location mass)))

(define (get-physical-attributes thing)
  (quality-attributes (hash-ref (thing (lambda (thing) (thing-qualities thing))) 'physical)))

(define (physical-location thing)
  (physical-attributes-location (get-physical-attributes thing)))
(define (set-physical-location! thing)
  (lambda (new-location) (new-location (schedule (lambda () (set-physical-attributes-location!
                                              (get-physical-attributes thing)
                                              new-location))))))
(define (physical-mass thing)
  (physical-attributes-mass (get-physical-attributes thing)))
(define (set-physical-mass! thing)
  (lambda (new-mass) (schedule (lambda () (set-physical-attributes-mass!
                                           (get-physical-attributes thing)
                                           new-mass)))))


(define (add-mass thing)
  (lambda (addition) (lambda () (set-physical-mass! thing (+ (physical-mass thing) addition)))))
(define (print-mass thing)
  (lambda () (printf "~a's mass is ~a\n" (thing (lambda (thing) (thing-name thing))) (physical-mass thing))))
