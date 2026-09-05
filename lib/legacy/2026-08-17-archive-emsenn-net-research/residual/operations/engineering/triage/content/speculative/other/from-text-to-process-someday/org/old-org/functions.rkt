#lang racket

(provide make-location
	 give
	 receive
	 receive-multiple-items
	 set-inventory)

(define (make-location) (make-hash (list (cons 'contents (list)))))

(define (give #:date [date #f]
	      #:item [item #f]
	      #:quantity [quantity #f]
	      #:location [location #f]
	      #:recipient [recipient #f])
  (if location
      (if (hash-has-key? location item)
	  (hash-set! location item (- (hash-ref location item) quantity))
	  (log-error "Tried to give something from somewhere it doesn't exist"))
      (log-error "No location specified")))

(define (receive #:date [date #f]
		 #:item [item #f]
		 #:quantity [quantity #f]
		 #:location [location #f]
		 #:giver [giver #f])
  (if location
      (if (hash-has-key? location item)
	  (hash-set! location item (+ (hash-ref location item) quantity))
	  (hash-set! location item quantity))
      (display "No location specified.\n")))

(define (receive-multiple-items #:date [date #f]
				#:location [location #f]
				#:giver [giver #f]
				#:items [items #f])
  (if items
      (map (lambda (item)
	     (receive #:date date
		      #:location location
		      #:giver giver
		      #:item (car item)
		      #:quantity (cdr item)))
	   items)
      (display "No items specified.\n")))

(define (give-multiple-items #:date [date #f]
			     #:location [location #f]
			     #:recipient [recipient #f]
			     #:items [items #f])
  (if items
      (map (lambda (item)
	     (give #:date date
		   #:location location
		   #:recipient recipient
		   #:item (car item)
		   #:quantity (cdr item)))
	   items)
      (display "No items specified.\n")))

(define (set-inventory #:location [location #f]
		       #:items [items #f])
  (if items
      ((lambda ()
	(print "AHOIHFIU!\n")
	(set! location (make-location))
	(map (lambda (item)
	       (hash-set! location (car item) (cdr item)))
	     items)))
      (display "No items specified.\n")))
