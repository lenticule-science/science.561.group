;; test-predicate-modality.scm
;; run with:  guile test-predicate-modality.scm

(add-to-load-path ".")
(use-modules (predicate-modality))

;; Assert a base relation
(define r (relate stone contains iron))

;; Let the predicate own truth
(format #t "check Stone contains Iron -> ~a\n" (check stone contains iron))

(define asserted-by
  (make-atom 'asserted-by 'asserted-by S2 *spatial*
             (lambda (x) #t)
             (lambda (pair)
               ;; optional: (let ((s (car pair)) (o (cadr pair))) …)
               #t)
             (lambda (x) #t)
             (lambda (s o) (related? s asserted-by o))))

(define agent
  (make-atom 'alice 'Alice S2 *spatial*
             (lambda (x) #t)
             (lambda (pair) #t)
             (lambda (x) #t)
             (lambda (s o) #t)))


(define r2 (relate r asserted-by agent))
(format #t "check r asserted-by agent -> ~a\n" (check r asserted-by agent))
