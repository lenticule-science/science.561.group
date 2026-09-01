;;; predicate-modality.scm
;;; A minimal stratified-modality engine for a relational matrix in Guile

(define-module (predicate-modality)
  #:export ( ;; core records
            make-stratum stratum? stratum-name stratum-level
            make-modality modality? modality-name
            modality-reflect modality-coreflect
            modality-tensor modality-cotensor
            make-atom atom? atom-id atom-name atom-stratum atom-modality
            make-cell cell? cell-subject cell-predicate cell-object
            ;; matrix ops
            relate check related? compose invert
            ;; graph queries
            ask objects subjects predicates
            ;; serialization helpers
            cell->alist atom->alist
            ;; demo atoms/modalities (optional)
            *spatial* contains stone iron
	    S0 S1 S2)

  ;; SRFI for hash tables (Guile provides (ice-9 hash-table) by default)
  #:use-module (ice-9 hash-table)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-9)
  #:use-module (srfi srfi-26))

;; ------------------------------------------------------------
;; Strata and Modalities
;; ------------------------------------------------------------

;; A stratum is a named level; lower integer means "deeper" or "inner".
(define-record-type <stratum>
  (make-stratum name level)
  stratum?
  (name stratum-name)     ; symbol
  (level stratum-level))  ; integer

;; A modality mediates movement between strata and provides combination ops.
;; reflect/coreflect: single-argument maps that move atoms between strata
;; tensor/cotensor:    combine two atoms to produce a directional "act"
(define-record-type <modality>
  (make-modality name reflect coreflect tensor cotensor)
  modality?
  (name modality-name)             ; symbol
  (reflect modality-reflect)       ; (atom -> atom)
  (coreflect modality-coreflect)   ; (atom -> atom)
  (tensor modality-tensor)         ; (atom atom -> cell or atom)
  (cotensor modality-cotensor))    ; (atom atom -> cell or atom)

;; ------------------------------------------------------------
;; Atoms and Cells
;; ------------------------------------------------------------

;; Atoms carry their native stratum and home modality, plus role lambdas.
;; check-fn lives in the atom and is used when the atom is in predicate slot.
;;
;; Role lambdas:
;;   subj-fn : (other -> side-effects|derived-value)    ; subject behavior
;;   pred-fn : ((s o) -> side-effects|derived-value)    ; predicate behavior
;;   obj-fn  : (other -> side-effects|derived-value)    ; object behavior
;;   check-fn: (s o -> boolean)                         ; truth test owned by predicate
;;
(define-record-type <atom>
  (make-atom id name stratum modality subj-fn pred-fn obj-fn check-fn)
  atom?
  (id atom-id)                        ; symbol/uuid
  (name atom-name)                    ; symbol
  (stratum atom-stratum)              ; <stratum>
  (modality atom-modality)            ; <modality>
  (subj-fn atom-subject-fn)
  (pred-fn atom-predicate-fn)
  (obj-fn atom-object-fn)
  (check-fn atom-check-fn))

;; Cells are minimal acts; subject/predicate/object may be atoms OR cells.
(define-record-type <cell>
  (make-cell subject predicate object)
  cell?
  (subject cell-subject)     ; <atom> | <cell>
  (predicate cell-predicate) ; <atom> (typically) | <cell> (higher-order)
  (object cell-object))      ; <atom> | <cell>

;; ------------------------------------------------------------
;; Storage (in-memory)
;; ------------------------------------------------------------

;; We store assertions in a hash table keyed by a structural fingerprint.
(define *relations* (make-hash-table))

(define (fingerprint x)
  (cond
   ((atom? x) (string-append "A:" (symbol->string (atom-id x))))
   ((cell? x) (string-append "C:("
                             (fingerprint (cell-subject x)) "|"
                             (fingerprint (cell-predicate x)) "|"
                             (fingerprint (cell-object x)) ")"))
   (else (error "Unknown entity type for fingerprint" x))))

(define (rel-key s p o)
  (string-append (fingerprint s) "::" (fingerprint p) "::" (fingerprint o)))

(define (related? s p o)
  (hash-ref *relations* (rel-key s p o) #f))

;; ------------------------------------------------------------
;; Helpers
;; ------------------------------------------------------------

(define (same-or-lower-level? a b)
  (letrec* ((lvl (lambda (x)
                   (cond
                    ((atom? x) (stratum-level (atom-stratum x)))
                    ((cell? x)
                     (max (lvl (cell-subject x))
                          (lvl (cell-predicate x))
                          (lvl (cell-object x))))
                    (else (error "Cannot compute level for" x))))))
    (<= (lvl a) (lvl b))))

(define (legal-composition? r1 r2)
  ;; Composition is allowed when r1.object == r2.subject (by fingerprint)
  ;; and direction respects stratification monotonicity.
  (and (string=? (fingerprint (cell-object r1))
                 (fingerprint (cell-subject r2)))
       (same-or-lower-level? r1 r2)))

(define (act x role payload)
  (when (atom? x)
    (cond
     ((eq? role 'subject)   ((atom-subject-fn x) payload))
     ((eq? role 'predicate) ((atom-predicate-fn x) payload))
     ((eq? role 'object)    ((atom-object-fn x) payload))
     (else (error "Unknown role" role)))))

;; ------------------------------------------------------------
;; Core API: relate / check / compose / invert
;; ------------------------------------------------------------

(define (relate s p o)
  ;; role behaviors
  (act s 'subject o)
  (act p 'predicate (list s o))
  (act o 'object s)
  ;; assert
  (hash-set! *relations* (rel-key s p o) #t)
  (make-cell s p o))

(define (check s p o)
  ;; delegate truth definition to predicate if it is an atom;
  ;; if predicate is itself a cell, you can define higher-order checks by convention.
  (cond
   ((atom? p) ((atom-check-fn p) s o))
   ((cell? p)
    ;; naive higher-order: p is a relation describing how to check (s,o)
    ;; Example pattern: ((p-subj) describes a predicate atom; apply its check)
    (let ((pp (cell-subject p)))
      (if (atom? pp)
          ((atom-check-fn pp) s o)
          (error "Higher-order predicate cell not supported without atom in subject" p))))
   (else (error "Predicate must be atom or cell" p))))

(define (compose r1 r2)
  (if (legal-composition? r1 r2)
      (make-cell (cell-subject r1)
                 (cell-predicate r2)  ; direction flows through r2’s predicate
                 (cell-object r2))
      (error "Illegal composition (stratification or mismatch)" r1 r2)))

(define (invert r)
  ;; swap ends, derive an "inverse" predicate cell talking about the original predicate
  (let* ((p (cell-predicate r))
         (invp (if (atom? p)
                   (make-cell p         ; subject: the original predicate atom
                              p          ; predicate: reflexive "is" by convention
                              p)         ; object: itself (placeholder)
                   p)))
    (make-cell (cell-object r) invp (cell-subject r))))

;; ------------------------------------------------------------
;; Queries
;; ------------------------------------------------------------

(define (objects s p)
  ;; all o where related?(s,p,o) is true
  (let ((prefix (string-append (fingerprint s) "::" (fingerprint p) "::")))
    (let loop ((kvs (hash-map->list cons *relations*)) (acc '()))
      (if (null? kvs) (reverse acc)
          (let* ((kv (car kvs))
                 (k (car kv)) (v (cdr kv)))
            (if (and v (string-prefix? prefix k))
                (loop (cdr kvs) (cons k acc))
                (loop (cdr kvs) acc)))))))

(define (subjects p o)
  (let ((suffix (string-append "::" (fingerprint p) "::" (fingerprint o))))
    (let loop ((kvs (hash-map->list cons *relations*)) (acc '()))
      (if (null? kvs) (reverse acc)
          (let* ((kv (car kvs))
                 (k (car kv)) (v (cdr kv)))
            (if (and v (string-suffix? suffix k))
                (loop (cdr kvs) (cons k acc))
                (loop (cdr kvs) acc)))))))

(define (predicates s o)
  (let* ((fs (fingerprint s)) (fo (fingerprint o)))
    (let loop ((kvs (hash-map->list cons *relations*)) (acc '()))
      (if (null? kvs) (reverse acc)
          (let* ((kv (car kvs))
                 (k (car kv)) (v (cdr kv)))
            ;; key is "S::P::O"
            (if (and v
                     (string-prefix? (string-append fs "::") k)
                     (string-suffix? (string-append "::" fo) k))
                (loop (cdr kvs) (cons k acc))
                (loop (cdr kvs) acc)))))))

(define (ask s p)
  ;; return fingerprints of objects satisfying (s p ?o)
  (objects s p))

;; ------------------------------------------------------------
;; Serialization helpers
;; ------------------------------------------------------------

(define (atom->alist a)
  (if (atom? a)
      `((type . atom)
        (id . ,(atom-id a))
        (name . ,(atom-name a))
        (stratum . ,(stratum-name (atom-stratum a)))
        (level . ,(stratum-level (atom-stratum a)))
        (modality . ,(modality-name (atom-modality a))))
      `((type . unknown))))

(define (cell->alist c)
  (define (repr x)
    (cond
     ((atom? x) (atom->alist x))
     ((cell? x) `((type . cell)
                  (subject . ,(repr (cell-subject x)))
                  (predicate . ,(repr (cell-predicate x)))
                  (object . ,(repr (cell-object x)))))
     (else `((type . unknown)))))
  (repr c))

;; ------------------------------------------------------------
;; Example modality and atoms (demonstration)
;; ------------------------------------------------------------

;; Strata
(define S0 (make-stratum 'material 0))
(define S1 (make-stratum 'symbolic 1))
(define S2 (make-stratum 'meta 2))

;; A simple "spatial" modality that keeps atoms in their stratum
;; but could move them if you encode policies in reflect/coreflect.
(define (id-reflect a) a)
(define (id-coreflect a) a)

(define (tensor-spatial a b)
  ;; combining as a cell: a -> contains -> b requires a predicate atom downstream;
  ;; here tensor just returns a placeholder atom or a cell as needed.
  (make-cell a (make-cell a a a) b))  ;; placeholder higher-order predicate cell

(define (cotensor-spatial a b)
  (make-cell b (make-cell b b b) a))

(define *spatial*
  (make-modality 'spatial id-reflect id-coreflect tensor-spatial cotensor-spatial))

;; role lambdas that do nothing but are present for extension
(define (noop1 x) #t)
(define (noop2 x y) #t)

;; Example atoms
(define stone
  (make-atom 'stone 'Stone S0 *spatial*
             noop1 noop2 noop1
             (lambda (s o)    ; used if 'Stone' is predicate, which it usually isn't
               (and (related? s stone o) #t))))

(define iron
  (make-atom 'iron 'Iron S0 *spatial*
             noop1 noop2 noop1
             (lambda (s o)
               (and (related? s iron o) #t))))

;; A real predicate atom: 'contains'
(define contains
  (make-atom 'contains 'contains S1 *spatial*
             noop1
             (lambda (pair) #t)  ;; predicate role side-effects no-op
             noop1
             (lambda (s o)
               ;; Truth for 'contains' is owned here. You can enrich this arbitrarily.
               ;; Minimal policy: relation must be asserted AND respect monotone level.
               (and (related? s contains o)
                    (same-or-lower-level? s o)))))

;; ------------------------------------------------------------
;; End of module
;; ------------------------------------------------------------
