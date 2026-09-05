#lang racket

(require "../qtmud/main.rkt"
         "../qtmud/library/animation-for-mudsocket.rkt"
         "../qtmud/library/containers.rkt"
         "../qtmud/library/containers-for-mudsocket.rkt"
         "../qtmud/library/descriptions.rkt"
         "../qtmud/library/exits.rkt"
         "../qtmud/library/mudsocket.rkt"
         "universe-procedures.rkt"
         (prefix-in areas: "areas/main.rkt"))

(run-logger (create-logger 'emsMUD))

(define emsverse (create-universe "emsVerse"))
(define create-thing (create-thing-creator-for-universe emsverse))

(add-container-procedures-to-universe! emsverse)
(add-containers-for-mudsocket-procedures-to-universe! emsverse)
(add-description-procedures-to-universe! emsverse)
(add-exit-procedures-to-universe! emsverse)

(add-emsverse-procedures-to-universe! emsverse)

(add-event-to-universe!
 (make-mudsocket-tick-event-for-universe emsverse)
 emsverse)

(define (hash-things-by-quality listed-things
                                sort-quality)
  (define hashed-things (make-hash))
  (map
   (λ (listed-thing)
     (hash-set! hashed-things
                (thing-quality listed-thing
                               sort-quality)
                listed-thing))
   listed-things)
  hashed-things)


(define (wc)
  (define count 0)
  (map
   (λ (t)
     (when (thing-has-quality? t 'description)
     (set! count (+ count (length (string-split (thing-quality t 'description)))))))
   (universe-things emsverse))
  count)

(define (set-area-exits! area-id
                         exits)
  (define exits-hash (make-hash exits))
  (define proper-exits
    (map (λ (exit-set)
           (define exit-key (car exit-set))
           (hash-set! exits-hash exit-key
                      (hash-ref areas
                                (hash-ref exits-hash
                                          exit-key))))
         exits))
  (set-thing-quality!
   (hash-ref areas area-id) 'exits (hash->list exits-hash)))



(define areas
  (hash-things-by-quality
   (list
    (areas:lobby:build-lobby! (create-thing))
    (areas:gardens:build-courtyard! (create-thing))
    (areas:gardens:makha-sa:build-center! (create-thing))
    )
   'area-id))

(set-area-exits!
 'lobby `(("gardens" . gardens:courtyard)))
(set-area-exits!
 'gardens:courtyard `(("lobby" . lobby)
                      ("makha-sa" . gardens:makha-sa:center)))
(set-area-exits!
 'gardens:makha-sa:center '(("gardens" . gardens:courtyard)))


(set-universe-procedure! emsverse 'spawn-room (λ () (hash-ref areas 'lobby)))

(define emsmud (run-universe emsverse))
