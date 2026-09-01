;;; ritm.scm --- minimal relational-topos runtime for Guile
;;; (c) you, emsenn. WTFPL or any permissive license you prefer.

(define-module (ritm core)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (ice-9 match)
  #:use-module (ice-9 hash-table)
  #:use-module (system base pmatch)
  #:export (;; cells
            make-cell cell? cell-id cell-data cell-data-set! cell-doc cell-doc-set!
            ;; relations
            relate! relations-of neighbors
            ;; registry
            register! resolve registered-symbols
            ;; docs
            doc! doc-of
            ;; spaces from modules
            module->space space? space-bindings space-relations
            space->alist
            ;; dynamics
            set-updater! step! tick!))

;; ----------------
;; Cells & docs
;; ----------------
(define-record-type <cell>
  (make-raw-cell id data doc updater)
  cell?
  (id      cell-id)
  (data    cell-data cell-data-set!)
  (doc     cell-doc  cell-doc-set!)
  (updater cell-updater cell-updater-set!))

(define (make-cell . args)
  ;; accept keyword-style arguments manually
  (let ((data (or (and=> (assoc-ref args #:data) values) #f))
        (doc (or (and=> (assoc-ref args #:doc) values) ""))
        (updater (or (and=> (assoc-ref args #:updater) values) #f)))
    (make-raw-cell (gensym 'cell) data doc updater)))

;; Attach or get docstrings to arbitrary values via a side table
(define %doc-table (make-hash-table)) ;; eq? keys

(define-syntax-rule (doc! value string)
  (begin
    (hashq-set! %doc-table value (if (string? string) string (object->string string)))
    value))

(define (doc-of value)
  (hashq-ref %doc-table value ""))

;; ---------------
;; Relations
;; ---------------
;; Each edge is (from-id to-id tag)
(define %edges (make-hash-table)) ;; id -> list of (to-id . tag)

(define (relate! from-cell to-cell tag)
  (let* ((fid (cell-id from-cell))
         (tid (cell-id to-cell))
         (lst (hashq-ref %edges fid '())))
    (hashq-set! %edges fid (acons tid tag lst))
    (values from-cell to-cell tag)))

(define (relations-of cell)
  (let* ((fid (cell-id cell))
         (lst (hashq-ref %edges fid '())))
    ;; return list of ((to-id . tag) ...) for inspection
    lst))

(define (neighbors cell)
  (map car (relations-of cell))) ;; list of neighbor IDs

;; ---------------
;; Registry (stable external names)
;; ---------------
(define %registry (make-hash-table)) ;; symbol -> cell

(define (register! sym cell)
  (hash-set! %registry sym cell)
  cell)

(define (resolve sym)
  (hash-ref %registry sym #f))

(define (registered-symbols)
  (hash-map->list (lambda (k v) k) %registry))

;; ---------------
;; Spaces from modules
;; ---------------
(define-record-type <space>
  (make-space bindings relations)
  space?
  (bindings space-bindings)  ;; alist: symbol -> value
  (relations space-relations)) ;; list: (from-sym to-sym tag)

(define (module->space mod)
  "Treat a Guile module as a site: objects are public bindings; trivial relations
   are induced by referencing (heuristic doc-only for now)."
  (let* ((iface (module-public-interface mod))
         (alist '()))
    (module-map
     (lambda (sym var)
       (set! alist (acons sym (variable-ref var) alist)))
     iface)
    ;; For now, we add no inferred edges; callers can relate! registered cells as needed.
    (make-space alist '())))

(define (space->alist sp)
  `((bindings . ,(space-bindings sp))
    (relations . ,(space-relations sp))))

;; ---------------
;; Dynamics
;; ---------------
;; Updater: (lambda (cell) -> new-data) stored per cell
(define (set-updater! cell proc)
  (cell-updater-set! cell proc)
  cell)

(define (step! cell)
  (match (cell-updater cell)
    (#f cell)
    (proc
     (let ((new (proc cell)))
       (cell-data-set! cell new)
       cell))))

(define (tick! cells)
  (for-each step! cells)
  cells)

;; ---------------
;; Handy demo values so loading never errors
;; ---------------
(define demo-A
  (doc!
   (register! 'A
              (make-cell
               #:data 'alpha
               #:doc  "A demo cell named A. Use (resolve 'A) to fetch it."))
   "Demo binding: A cell named A."))

(define demo-B
  (doc!
   (register! 'B
              (make-cell
               #:data '(beta 1)
               #:doc  "A demo cell named B."))
   "Demo binding: A cell named B."))

;; create a relation for the demo:
(relate! demo-A demo-B 'points-to)

;; give A a trivial updater:
(set-updater! demo-A (lambda (c) (match (cell-data c) ((sym) sym) (else (cell-data c)))))

;; Done. Loading this file should not error and exports a minimal API.
