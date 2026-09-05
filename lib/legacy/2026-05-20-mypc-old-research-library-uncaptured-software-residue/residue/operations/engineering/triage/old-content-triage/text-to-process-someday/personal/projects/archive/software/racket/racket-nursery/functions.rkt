#lang racket

;; gift journal

(define journal (make-hash
                 (list
                  (cons 'history (list))
                  (cons 'catalog (make-hash)))))

(define (record! event)
  (event)
  (hash-set! journal 'history (append (hash-ref journal 'history) (list event))))

(define (get-item id)
  (hash-ref (hash-ref journal 'catalog) id))

(define (add-item id)
  (record!
   (lambda ()
     (hash-set! (hash-ref journal 'catalog) id (make-hash (list (cons 'id id)))))))

(define (water
         #:id [id #f]
         #:amount [amount #f]
         #:notes [notes #f]
         #:date [date #f])
  (if (and id date)
      (let ([item (get-item id)])
        ; todo: make this handle locations (items with contents)
        (unless (hash-has-key? item 'water-log)
          (hash-set! item 'water-log (list)))
        (record!
         (lambda () (hash-set! item 'water-log (append (hash-ref item 'water-log) (list date))))))
      (raise "No ID/date provided")))

(define (plant
         #:id [id #f]
         #:quantity [quantity #f]
         #:date [date #f]
         #:location [location #f])
  (if (and id location)
      (let ([item (get-item id)])
        (unless (hash-has-key? item 'location)
          (hash-set! item 'location #f)))
      (when (hash-ref item 'location)
        (let* ([old-loc (hash-ref item 'location)]
               [old-loc-conts (hash-ref old-loc 'contents)])
          (void))) ;; remove item from old-loc-conts
      (record!
       (lambda (hash-set! item 'location location)))
      (raise "No ID/location provided")))

(define (transplant
         #:id [id #f]
         #:quantity [quantity #f]
         #:date [date #f]
         #:location [location #f])
  (void))
