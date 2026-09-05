#lang racket
;;; Take a simple set of functions for operating on global state:

(define sval 0)                          ; initialize state to 0
(define (gets) sval)                     ; return state
(define (puts! s) (set! sval s))         ; replace state with `s'

;; increment state by 1
(define (incs!)
  (let ((s (gets)))                      ; get the state
    (puts! (add1 s))))                     ; then replace it incremented

;; replace the state and return its old value
(define (swaps! s)
  (let ((s0 (gets)))                     ; get the initial state
    (begin
      (puts! s)                          ; then replace it with the new state
      s0)))                              ; and finally return the old state

;;; This implementation comes naturally---a getter and a setter that can be sequenced
;;; to combine multiple stateful effects into a larger effect.

;;; On the other hand it suffers from the problem of `action at a distance',
;;; where changes to state may occur unnoticed in some far-off place in the code.
;;; The `!' suffix arose from this problem, loudly indicating `impure' code.

;;; Now for a 100% `pure' approach.

;;; The idea is to thread the state through both the inputs and outputs of the stateful functions.
;;; This is called `state-passing style'.

;;; The above are rewritten as functions from initial state to new state along with return value:

(define get0 (lambda (s) (cons s s)))        ; return state unchanged
(define (put0 s) (lambda (_) (list s)))      ; replace state and return empty pair
(define inc0 (lambda (s) (list (add1 s))))     ; increment state and return empty pair
(define (swap0 s) (lambda (s0) (cons s s0))) ; replace state and return its old value

;;; Within this framework, we can think of `get' and `inc' not as functions but as messages
;;; requesting something be done with the state when it arrives, and `put' and `swap' as messages
;;; parameterized by additional data (the new state in this case).

;;; We can make this more explicit with a macro for writing stateful effects
;;; and a set of functions for (de)constructing the results:

(define res cons)
; results are stored in a pair
(define res-new-state car)
; the first element is the state
(define res-ret-val cdr)
; the second is the return value

(define-syntax-rule (state s0 s ret) (lambda (s0) (res s ret)))
; (state foo bar baz) turns into (lambda (foo) (res bar baz)))
; so foo is... ?
; bar is the state
; and baz is the return value

(define get (state s s s))
; expands to
(define get/b
  (lambda (s)
    (res s s)))
; so everything - ???, state, and return value, are whatever s is

(define (put s) (state _ s '()))
; expands to
(define put/b
  (lambda (s)
    (lambda (_)
      (res s '()))))
; so s is the state, the return value is an empty list, and ??? is thrown away


;;; Two functions complete the implementation:

;; the trivial parameterized stateful effect
(define (return x) (state s s x))       ; pass the state unchanged and return `x'

;; combine a stateful effect with another parameterized by the intermediate result
(define (bind f k)
  (lambda (s)
    (let ((res (f s)))                  ; apply the first effect to the initial state
      ((k (res-ret-val res))            ; and produce a new effect from its return value
       (res-new-state res)))))          ; which is run on the intermediate state

;;; Equipped with these we can again write `inc' and `swap' in terms of `get' and `put':

(define inc
  (bind get                             ; first get the state
    (lambda (s)
      (put (add1 s)))))                   ; then put it back incremented 

(define (swap s)
  (bind get                             ; first get the initial state
    (lambda (s0) 
      (bind (put s)                     ; then put the new state
        (const (return s0))))))         ; and finally return the old state

;;; To conclude, `bind' and `return' restore both the composability and expressivity 
;;; of the impure implementation, where complex effects are composed from primitives,
;;; and their sequential nature is clearly expressed.
