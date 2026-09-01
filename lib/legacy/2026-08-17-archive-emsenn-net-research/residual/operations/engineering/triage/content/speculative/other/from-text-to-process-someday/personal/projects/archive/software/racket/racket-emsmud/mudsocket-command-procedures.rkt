#lang racket

(require "../qtmud/main.rkt")

(provide
 make-pet-mudsocket-command-for-thing
 make-squint-mudsocket-command-for-thing)

(define (make-squint-mudsocket-command-for-thing commanding-thing)
  (λ (command-arguments)
    (define commanding-thing-name (thing-name commanding-thing))
    (define (message-thing message thing)
      (add-string-to-thing-quality! message thing 'mudsocket-output-buffer))
    (define (message-commanding-thing message)
      (message-thing message commanding-thing))
    (define (message-commanding-thing-container-contents message)
      (map
       (λ (t)
         (message-thing message t))
       (remove commanding-thing
               (things-with-quality (thing-quality
                                     (thing-quality commanding-thing
                                                    'container)
                                     'contents)
                                    'mudsocket-output-buffer))))
    (cond
      [(hash-empty? command-arguments)
       (message-commanding-thing
        "You squint at nothing in particular.")
       (message-commanding-thing-container-contents
        (format "~a squints."
                commanding-thing-name))]
      [(hash-has-key? command-arguments 'line)
       (define command-arguments-line
         (hash-ref command-arguments 'line))
       (define matching-things
         (search-things-by-term
          (thing-quality
           (thing-quality commanding-thing
                          'container)
           'contents)
          command-arguments-line))
       (cond
         [(null? matching-things)
          (message-commanding-thing
           (format "You cannot squint at \"~a\"."
                   command-arguments-line))]
         [(= (length matching-things) 1)
          (define matching-thing (first matching-things))
          (define matching-thing-name
            (thing-name matching-thing))
          (message-commanding-thing
           (format "You squint at ~a."
                   matching-thing-name))
          (message-commanding-thing-container-contents
           (format "~a squints at ~a."
                   commanding-thing-name
                   matching-thing-name))
          (when (thing-has-quality? matching-thing
                                    'mudsocket-output-buffer)
            (message-thing (format "~a squints at you."
                                   commanding-thing-name)
                           matching-thing))
          (when (thing-has-procedure? matching-thing
                                      'squinted-at-by-thing)
            ((thing-procedure matching-thing
                              'squinted-at-by-thing)
             commanding-thing))]
         [else
          (message-thing
           (format
            "There are multiple things here matching \"~a\": ~a"
            command-arguments-line
            (list-thing-names matching-things)))])])))

(define (make-pet-mudsocket-command-for-thing commanding-thing)
  (λ (command-arguments)
    (define commanding-thing-name (thing-name commanding-thing))
    (define (message-thing message thing)
      (add-string-to-thing-quality! message thing 'mudsocket-output-buffer))
    (define (message-commanding-thing message)
      (message-thing message commanding-thing))
    (define (message-commanding-thing-container-contents message)
      (map
       (λ (t)
         (message-thing message t))
       (remove commanding-thing
               (things-with-quality (thing-quality
                                     (thing-quality commanding-thing
                                                    'container)
                                     'contents)
                                    'mudsocket-output-buffer))))
    (cond
      [(hash-empty? command-arguments)
       (message-commanding-thing
        "Try petting something.")]
      [(hash-has-key? command-arguments 'line)
       (define command-arguments-line
         (hash-ref command-arguments 'line))
       (define matching-things
         (search-things-by-term
          (thing-quality
           (thing-quality commanding-thing
                          'container)
           'contents)
          command-arguments-line))
       (cond
         [(null? matching-things)
          (message-commanding-thing
           (format "You cannot pet \"~a\"."
                   command-arguments-line))]
         [(= (length matching-things) 1)
          (define matching-thing (first matching-things))
          (define matching-thing-name
            (thing-name matching-thing))
          (cond
            [(and (thing-has-quality? matching-thing
                                      'pettable)
                  (thing-quality matching-thing 'pettable))
             (message-commanding-thing
              (format "You pet ~a."
                      matching-thing-name))
             (message-commanding-thing-container-contents
              (format "~a pets ~a."
                      commanding-thing-name
                      matching-thing-name))
             (when (thing-has-quality? matching-thing
                                       'mudsocket-output-buffer)
               (message-thing (format "~a pets you."
                                      commanding-thing-name)))
             (when (thing-has-procedure? matching-thing
                                         'petted-by-thing)
               ((thing-procedure matching-thing
                                 'petted-by-thing)
                commanding-thing))]
            [else
             (message-commanding-thing
              (format "You cannot pet ~a."
                      matching-thing-name))
             (when (thing-has-quality? matching-thing
                                       'mudsocket-output-buffer)
               (message-thing
                (format
                 "It looks like ~a was considering petting you."
                 commanding-thing-name)
                matching-thing))])]
         [else
          (message-thing
           (format
            "There are multiple things here matching \"~a\": ~a"
            command-arguments-line
            (list-thing-names matching-things)))])])))
