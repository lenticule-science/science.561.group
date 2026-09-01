#lang racket

(require "accounts.rkt"
         "actions.rkt"
         "engine.rkt"
         "mudmap.rkt"
         "mudsocket.rkt"
         "talker.rkt"
         "./teraum/main.rkt")

(provide emstuff)

(define emstuff
  (run-engine
   (make-engine
    "emstuff"
    (list (accounts)
          (mudsocket)
          (talker)))))
