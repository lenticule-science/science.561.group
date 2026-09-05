#lang racket

(require "../qtmud/main.rkt"
         "../qtmud/library/animation-for-mudsocket.rkt"
         "mudsocket-command-procedures.rkt")

(provide add-emsverse-procedures-to-universe!)

(define (make-mudsocket-connection-message connected-thing)
  (format (§ "Your connection to emsenn's dimension from ~a:~a "
             "has been accepted. Welcome.\n\n"
             "You've been given the user-name ~a\n"
             "Proceed with intention, please:\n"
             "what exists here was created by one person wishing "
             "to communicate with others.\n\n"
             "Interact with the universe by typing commands and "
             "pressing ENTER\n"
             "Try getting started with the \"help\" command.")
          (thing-quality connected-thing 'mudsocket-ip)
          (thing-quality connected-thing 'mudsocket-port)
          (thing-name connected-thing)))

(define (handle-mudsocket-connection logged-in-thing)
   (add-quality-to-thing! 'container logged-in-thing)
   (add-keyvalues-to-thing-quality!
    (list
     (cons "look"
           (make-look-mudsocket-command-for-thing logged-in-thing))
     (cons "move"
           (make-move-mudsocket-command-for-thing logged-in-thing))
     (cons "squint"
           (make-squint-mudsocket-command-for-thing logged-in-thing))
     (cons "pet"
           (make-pet-mudsocket-command-for-thing logged-in-thing))
      )
    logged-in-thing 'mudsocket-commands)
   ((universe-procedure (thing-universe logged-in-thing)
                        'move-thing-into-thing!)
    logged-in-thing
    ((universe-procedure (thing-universe logged-in-thing)
                         'spawn-room))))

(define (make-mudsocket-help-response helped-thing)
   (§ "You're connected to emsenn's dimension, a virtual universe e "
      "created. To interact, type commands and press ENTER.\n\n"
      "(List all available commands with the \"commands\" command.)"))


(define (add-emsverse-procedures-to-universe! changed-universe)
  (define emsverse-procedures
    (list
     (cons 'make-mudsocket-connection-message
           make-mudsocket-connection-message)
     (cons 'handle-mudsocket-connection
           handle-mudsocket-connection)
     (cons 'make-mudsocket-help-response
           make-mudsocket-help-response)
     ))
  (log-debug "Adding emsverse procedures to ~a"
             (universe-name changed-universe))
  (add-procedures-to-universe! emsverse-procedures changed-universe))
