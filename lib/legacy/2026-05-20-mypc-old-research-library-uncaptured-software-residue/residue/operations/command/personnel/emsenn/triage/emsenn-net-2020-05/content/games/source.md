+++
title = "emsenn's MUD"
author = ["emsenn"]
draft = false
+++

## code {#code}

This section contains the code that is the actual MUD.

<div class="ox-hugo-toc toc local">
<div></div>

- [engine code](#engine-code)
- [world code](#world-code)

</div>
<!--endtoc-->


### engine code {#engine-code}

<div class="ox-hugo-toc toc local">
<div></div>

- [accounts](#accounts)
- [actions](#actions)
- [commands](#commands)
- [engine](#engine)
- [main](#main)
- [mudmap](#mudmap)
- [mudsocket](#mudsocket)
- [parser](#parser)
- [recipes](#recipes)
- [talker](#talker)
- [utilities](#utilities)

</div>
<!--endtoc-->


#### accounts {#accounts}

This module has what few procedures there are for handling user accounts.

```racket
#lang racket

(require racket/serialize)
(require racket/date)

(require "engine.rkt")

(provide accounts)

(define (accounts [account-file "user-accounts.rktd"])
  (define known-accounts (make-hash))
  (define (load-accounts)
    (when (file-exists? account-file)
      (log-debug "Loading accounts from ~a" account-file)
      (with-handlers
	  ([exn:fail:filesystem:errno?
	    (λ (E) (log-warning "Failed to load accounts: ~a" E))])
	(with-input-from-file account-file
	  (λ () (set! known-accounts (deserialize (read))))))))
  (define (save-accounts)
    (cond [(serializable? known-accounts)
	   (with-output-to-file account-file
	     (λ () (write (serialize known-accounts)))
	     #:exists 'replace)
	   (load-accounts)]
	  [else (log-warning "Account data not serializable.")]))
  (define (create-account name pass)
    (log-info "Creating new user account named ~a" name)
    (hash-set! known-accounts name
	       (make-hash
		(list
		 (cons 'name name)
		 (cons 'pass pass)
		 (cons 'birth-time (current-date)))))
    (save-accounts))
  (define (account? name) (hash-has-key? known-accounts name))
  (define (account name) (hash-ref known-accounts name))
  (λ (state)
    (let ([set-hook!
	   (λ (hook value)
	     (hash-set!
	      (mud-hooks (cdr state))
	      hook value))])
      (set-hook! 'account account)
      (set-hook! 'account? account?)
      (set-hook! 'create-account create-account)
      (set-hook! 'save-accounts save-accounts))
    (load-accounts)
    state))
```


#### actions {#actions}

```racket
#lang racket
(require "./engine.rkt")
(provide actions)

(define (actions)
  (define actions (make-hash))
  (define (load state)
    (let ([schedule (car state)]
	  [mud (cdr state)])
      (hash-set! (mud-hooks mud)
	       'apply-actions-quality
	       (λ (thing)
		 (let ([created-actions (list)])
		   (for-each
		    (λ (action)
		      (let ([record
			     (list thing (car action) (cdr action))])
			(set! created-actions
			      (append (list record) created-actions))
			(let ([chance (car action)])
			  (hash-set!
			   actions chance
			   (cond [(hash-has-key? actions chance)
				  (append (list record)
					  (hash-ref actions chance))]
				 [else (list record)])))))
		    ((quality-getter thing) 'actions))
		   ((quality-setter thing)
		    'actions created-actions))))
      (schedule tick)
      state))
  (define (tick state)
    (let ([triggered (list)]
	  [schedule (car state)]
	  [mud (cdr state)])
      (hash-map actions
		(λ (chance records)
		  (for-each (λ (record)
			      (when (<= (random 10000) chance)
				(set! triggered
				      (append (list record)
					      triggered))))
			    records)))
	 (for-each
	   (λ (action)
	     (let* ([actor (first action)]
		    [task (third action)]
		    [actor-quality (quality-getter actor)]
		    [actor-location (actor-quality 'location)]
		    [actor-exits (actor-quality 'exits)])
	       (cond
		 [(string? task)
		  ;send to things in th environment
		  (let* ([environment (cond [actor-location actor-location]
					    [actor-exits actor])])
		    (when (procedure? environment)
		      (let ([environment-contents
			     ((quality-getter environment) 'contents)])
			(for-each
			 (λ (thing)
			   (((string-quality-appender thing) 'client-out)
			   task))
			 (things-with-quality environment-contents 'client-out)))))
		  ]
		 [(procedure? task)
		  (task actor)])))
	   triggered)
      (schedule tick)
      state))
  load)
```


#### commands {#commands}

<div class="ox-hugo-toc toc local">
<div></div>

- [`commands` command](#commands-command)
- [`look` command](#look-command)
- [`move` command](#move-command)
- [`trivia` command](#trivia-command)
- [`who` command](#who-command)

</div>
<!--endtoc-->


##### `commands` command {#commands-command}

```racket
#lang racket
(require "../engine.rkt"
	 "../utilities/strings.rkt")
(provide commands)
(define commands
  (lambda (thing)
    (define quality (quality-getter thing))
    (define set-quality! (quality-setter thing))
    (define add-to-out ((string-quality-appender thing) 'client-out))
    (lambda (args)
      (let ([commands (quality 'commands)])
	(add-to-out (format
		     "You have the following commands: ~a"
		     (oxfordize-list (hash-keys commands))))))))
```


##### `look` command {#look-command}

```racket
#lang racket

(require "../engine.rkt"
	 "../utilities/strings.rkt")
(provide look)

(define (look thing)
  (define quality (quality-getter thing))
  (define set-quality! (quality-setter thing))
  (define add-to-out ((string-quality-appender thing) 'client-out))
  (define (look-area area)
    (let* ([area-quality (quality-getter area)]
	   [area-desc (area-quality 'description)]
	   [area-exits (area-quality 'exits)]
	   [area-contents (area-quality 'contents)])
      (log-debug "area contents are ~a" area-contents)
      (add-to-out (format "[~a]" (name area)))
      (when area-desc (add-to-out (format "~a" area-desc)))
      (when area-contents
	(let ([massive-contents
	       (things-with-quality area-contents 'mass)])
	  (unless (null? massive-contents)
	    (add-to-out
	     (format "Contents: ~a"
			 (oxfordize-list
			  (map (lambda (thing)
				 (name thing))
			       massive-contents)))))
	  (when area-exits
	    (add-to-out
	     (format "Exits: ~a"
		     (oxfordize-list
		      (map symbol->string
			   (hash-keys area-exits))))))))))
  (define (look-item item)
    (let* ([item-quality (quality-getter item)]
	   [item-desc (item-quality 'description)]
	   [item-contents (item-quality 'contents)])
      (log-debug "ITEM CONTENTS ARE ~a" item-contents)
      (add-to-out (format "[~a]" (name item)))
      (when item-desc (add-to-out (format "~a" item-desc)))
      (when item-contents
	    (let ([massive-contents
		   (things-with-quality item-contents 'mass)])
	      (unless (null? massive-contents)
		(add-to-out
		 (format "Contents: ~a"
			 (oxfordize-list
			  (map (lambda (thing)
				 (name thing))
			       massive-contents)))))))))
  (λ (args)
    (cond [(hash-empty? args)
	   (look-area (quality 'location))]
	  [(hash-has-key? args "container")
	   (add-to-out "Looking inside things doesn't work yet.")]
	  [(hash-has-key? args 'line)
	   ; > look hairy banana
	   ; collect list of (looker inventory + looker location's contents)
	   (let* ([look-in (append (quality 'contents)
				   ((quality-getter (quality 'location)) 'contents))]
		  [matches (search look-in (hash-ref args 'line))])
	     (cond
	       [(procedure? matches)
		(look-item matches)]
	       [(string? matches)
		(add-to-out matches)]))])))
```


##### `move` command {#move-command}

```racket
#lang racket

(require "../engine.rkt"
	 "./look.rkt")
(provide move)
(define (move thing)
  (define quality (quality-getter thing))
  (define set-quality! (quality-setter thing))
  (define add-to-out ((string-quality-appender thing) 'client-out))
  (λ (args)
    (let* ([location (quality 'location)]
	   [location-quality (quality-getter location)]
	   [location-exits (location-quality 'exits)])
      (cond
	[(hash-has-key? args 'line)
	 (let ([desired-exit (string->symbol (hash-ref args 'line))])
	   (cond
	     [(hash-has-key? location-exits desired-exit)
	      (add-to-out (format "You attempt to move ~a" (hash-ref args 'line)))
	      ((car (thing (λ (thing) (thing-mud thing))))
	       (λ (mud)
		 ((hash-ref (mud-hooks (cdr mud)) 'move) thing (hash-ref location-exits desired-exit))
		 ((look thing) (make-hash))
		 mud))]
	     [else (add-to-out "Invalid exit.")]))]
	[else
	 (add-to-out "You must use this command with an exit. You can find those by using the \"look\" command.")]))))
```


##### `trivia` command {#trivia-command}

```racket
#lang racket

(require "../engine.rkt"
	 "../utilities/strings.rkt")
(provide trivia)


(define (trivia thing)
  (define quality (quality-getter thing))
  (define set-quality! (quality-setter thing))
  (define add-to-out ((string-quality-appender thing) 'client-out))
  (define (trivium thing)
    (let ([trivias ((quality-getter thing) 'trivia)])
      (add-to-out
       (cond
	 [(null? trivias) "There's no trivia recorded for ~a." (name thing)]
	 [else  (car (shuffle trivias))]))))
  (λ (args)
    (cond [(hash-empty? args)
	   (trivium (quality 'location))]
	  [(hash-has-key? args "container")
	   (add-to-out "Looking inside things doesn't work yet.")]
	  [(hash-has-key? args 'line)
	   (let* ([look-in (append (quality 'contents)
				   ((quality-getter (quality 'location)) 'contents))]
		  [matches (search look-in (hash-ref args 'line))])
	     (cond
	       [(procedure? matches)
		(trivium matches)]
	       [(string? matches)
		(add-to-out matches)]))])))
```


##### `who` command {#who-command}

```racket
#lang racket
(require "../engine.rkt"
	 "../utilities/strings.rkt")
(provide who)
(define (who thing)
    (define quality (quality-getter thing))
    (define set-quality! (quality-setter thing))
    (define add-to-out ((string-quality-appender thing) 'client-out))
    (lambda (args)
      (let ([current-who (quality 'commands)])
	(add-to-out (format
		     "The following users are currently connected: ~a"
		     (oxfordize-list ()))))))
```


#### engine {#engine}

```racket
#lang racket

(require "./utilities/strings.rkt")

(provide make-engine
	 run-engine
	 (struct-out mud)
	 (struct-out thing)
	 quality-getter
	 quality-setter
	 string-quality-appender
	 things-with-quality
	 matches?
	 search
	 name
	 rename!)

(struct mud (name logger tick events things hooks maker) #:mutable)
(struct thing (name grammar qualities mud) #:mutable)

(define (thing-maker mud)
  (lambda (name
	   #:nouns [nouns #f]
	   #:adjectives [adjectives #f]
	   #:qualities [qualities #f])
  (log-debug "Making a thing named ~a" name)
  (let ([thing
	 (thing name
		(make-hash
		 (list
		  (cons 'nouns
			(merge-stringy-lists nouns))
		  (cons 'adjectives
			(merge-stringy-lists adjectives))))
		(cond
		  [qualities
		   (make-hash (filter values qualities))]
		  [else (make-hash)])
		mud)])
    (define handler (λ (f) (f thing)))
    (when qualities
      (hash-map (thing-qualities thing)
		(λ (id quality)
		  (let ([apply-proc-key
			 (str-and-sym-list-joiner
			  (list "apply" id "quality") "-")]
			[hooks (mud-hooks (cdr mud))])
		    (when (hash-has-key? hooks apply-proc-key)
		      ((hash-ref hooks apply-proc-key) handler))))))
    (set-mud-things! (cdr mud) (append (list handler) (mud-things (cdr mud))))
    handler)))

(define (quality-getter thing)
  (λ (quality)
    (thing (lambda (thing)
	     (with-handlers
		 ([exn:fail:contract?
		   (λ (exn)
		     (log-warning "Tried to get non-existent ~a quality from ~a." quality (thing-name thing))
		     #f)])
	       (hash-ref (thing-qualities thing) quality))))))

(define (quality-setter thing)
  (λ (quality value)
    (log-debug "Setting ~a of ~a to ~a"
	       quality (name thing)
	       value)
    (thing (λ (thing) (hash-set! (thing-qualities thing) quality value)))))

(define string-quality-appender
  (lambda (thing)
    (lambda (quality)
      (lambda (value [newline #t])
	(let* ([get-quality (quality-getter thing)]
	       [set-quality! (quality-setter thing)]
	       [current-string (get-quality quality)])
	  (cond
	    [(> (string-length current-string) 0)
	     (set-quality! quality (string-join (list current-string value)
						(cond [newline "\n"] [else ""])))]
	    [else (set-quality! quality (format "~a" value))]))))))

(define (things-with-quality things quality)
  (log-debug "Looking at things ~a for quality ~a" things quality)
    (filter values (map (λ (thing) (let ([result (thing (λ (thing) (hash-has-key? (thing-qualities thing) quality)))]) (cond [result thing][else result]))) things)))

(define (matches? thing term)
    (cond [(string=? (string-downcase (name thing)) term) #t]
	  [else #f]))

(define search
  (lambda (things term)
    (let ([matches
	   (filter
	    values
	    (map
	     (lambda (thing)
	       (cond [(matches? thing term) thing]
		     [else #f]))
	     things))])
      (cond
	[(= (length matches) 0)
	 "No matching things."]
	[(= (length matches) 1)
	 (car matches)]
	[else
	 (format "Multiple matches: ~a"
		 (oxfordize-list
		  (map (lambda (thing) (name thing)) matches)))]))))
(define name
  (lambda (thing)
    (thing (lambda (thing) (thing-name thing)))))
(define rename!
  (lambda (thing name)
    (thing (lambda (thing) (set-thing-name! thing name)))))

; Given a name and perhaps a sequence of functions, returns a pair, the first element of which is the engine's scheduling function and the second element of which is the MUD's current state.
(define (make-engine name [events #f])
  (define l (make-logger 'MUD))
  (define L (make-log-receiver l 'debug))
  (current-logger l)
  (define M (mud name ; MUD's name
		 (cons l L) ; logger and log-receiver
		 0 ; tick-count
		 (cond [events events][else '()]) ; scheduled events
		 '() ; things
		 (make-hash) ; hooks
		 (void))) ; maker
  (define (s e) (when (procedure? e) (set-mud-events! M (append (mud-events M) (list e)))))
  (define R (cons s M))
  (set-mud-maker! M (thing-maker R))
  ; M : state, s : scheduler, R: pair of scheduler and state
  (log-debug "Made MUD engine named ~a." name)
  R)

; Given the MUD's current state, calls all scheduled functions and returns the MUD's new state.
(define (tick R)
  ; "Le temps est ce qui empêche que tout soit donné tout d'un coup."
  (let* ([state (cdr R)]
	 [events (mud-events state)])
    (let loop ()
      (unless (null? events)
	(let ([event (car events)])
	  (let ([event-result (event R)])
	    (when event-result (set! R event-result)))
	  (set! events (cdr events))
	  (let ([current-state (cdr R)])
	    (set-mud-events! current-state (cdr (mud-events current-state))))
	(loop))))
    R))

; Given a MUD's state, sets up a thread for "ticking" the state forward. Passes through the current state.
(define (run-engine R)
  (let ([S (car R)] [M (cdr R)])
    ; S : scheduler, M : state
    (define (cim) (current-inexact-milliseconds))
    (define t (cim))
    (thread
     (λ ()
       (let loop ()
	 (define q (sync (cdr (mud-logger M))))
	 (printf "~a, tick #~a: ~a\n"
		 (vector-ref q 0) (mud-tick M) (vector-ref q 1))
	 (loop))))
    (thread
     (λ ()
       (let loop ()
	 (when (> (- (cim) t) 200)
	   (set-mud-tick! M (add1 (mud-tick M)))
	   (set! R (tick R)) (set! t (cim)))
	 (loop))))
    R))

; So to use:

; (define teraum (run-engine (make-engine "Teraum")))
; (define schedule (car teraum))
; (schedule (lambda (R)
;    (let ([same-scheduler (car R)]
;          [mud-state (cdr R)])
;    (log-debug "Current events are ~a"
;       (mud-events mud-state)))
```


#### main {#main}

```racket
#lang racket

(require "accounts.rkt"
	 "actions.rkt"
	 "engine.rkt"
	 "mudmap.rkt"
	 "mudsocket.rkt"
	 "talker.rkt"
	 "./teraum/main.rkt")

(define teraum
  (run-engine
   (make-engine
    "Teraum"
    (list (accounts)
	  (actions)
	  (mudmap teraum-map)
	  (mudsocket)
	  (talker)))))
```


#### mudmap {#mudmap}

```racket
#lang racket

(require "engine.rkt")
(provide mudmap)
(define (mudmap [areas (make-hash)])
  (λ (state)
    (let ([set-hook!
	   (λ (hook value)
	     (hash-set!
	      (mud-hooks (cdr state))
	      hook value))])
      (set-hook!
       'rooms areas)
      (set-hook!
       'room (λ (id) (hash-ref areas id)))
      (set-hook!
       'move
       (λ (mover destination)
	 (let* ([mover-quality (quality-getter mover)]
		[set-mover-quality! (quality-setter mover)]
		[destination-quality (quality-getter destination)]
		[set-destination-quality! (quality-setter destination)]
		[location (mover-quality 'location)])
	   (when location
	     (let ([location-quality (quality-getter location)]
		   [set-location-quality! (quality-setter location)])
	       (when (location-quality 'contents)
		 (set-location-quality!
		  'contents
		  (remove mover (location-quality 'contents))))))
	   (set-mover-quality! 'location destination)
	   (set-destination-quality!
	    'contents
	    (append (list mover) (destination-quality 'contents)))))))
    (let ([make (mud-maker (cdr state))])
      (hash-map areas (λ (id area) (let ([area (area make)])
				     (hash-set! areas id area))))
      (log-debug "Preloaded ~a areas." (length (hash-keys areas)))
      (hash-map areas
		(lambda (id area)
		  (let ([contents ((quality-getter area) 'contents)]
			[created-contents (list)])
		    (map (lambda (item)
			   (let ([item (item make)])
			     (set! created-contents
				   (append (list item)
					   created-contents))
			     ((quality-setter item) 'location area)))
			 contents)
		    ((quality-setter area) 'contents created-contents))
		  (hash-map ((quality-getter area) 'exits)
			    (lambda (id exit)
			      (hash-set! ((quality-getter area) 'exits)
					 id
					 (hash-ref areas exit)))))))
    state))
```


#### mudsocket {#mudsocket}

```racket
#lang racket

(require "engine.rkt"
	 "parser.rkt"
	 "./commands/commands.rkt"
	 "./commands/look.rkt"
	 "./commands/move.rkt"
	 "./commands/trivia.rkt")

(provide mudsocket)

(define mudsocket
  (lambda (#:port [port 4242])
    (define listener (tcp-listen port 5 #t))
    (define connections '())
    (define (accept-connection state)
      (define-values (in out) (tcp-accept listener))
      (define-values (lip lport rip rport) (tcp-addresses in #t))
      (let* ([thing
	      ((mud-maker (cdr state))
	       "MUDSocket Client"
	       #:qualities
	       (list
		(cons 'channels (list))
		(cons 'commands (make-hash))
		(cons 'contents (list))
		(cons 'client-in "")
		(cons 'client-out "")
		(cons 'mass 1)
		(cons 'mudsocket-in in)
		(cons 'mudsocket-out out)
		(cons 'mudsocket-ip rip)
		(cons 'mudsocket-port rport)))]
	     [quality (quality-getter thing)]
	     [set-quality! (quality-setter thing)])
	(set-quality! 'client-parser (client-login-parser thing))
	(set-quality! 'client-sender (client-sender thing))
	(set-quality! 'commands
		      (make-hash
		       (list
			(cons "commands" (commands thing))
			(cons "look" (look thing))
			(cons "move" (move thing))
			(cons "trivia" (trivia thing)))))
	(set! connections (append (list thing) connections))
	(set-quality! 'client-out "You've connected to Teraum, a role-playing game currently in early and active development. Please type your [desired] user-name and press ENTER.")
	(log-debug "Accepted connection from ~a:~a"
		   rip rport)))
    (define (load state)
      (let ([schedule (car state)]
	    [mud (cdr state)])
	(schedule tick)
	state))
    (define (tick state)
      (let ([schedule (car state)]
	    [mud (cdr state)])
	(map
	 (λ (client)
	   (let* ([quality (quality-getter client)]
		  [set-quality! (quality-setter client)]
		  [out-buffer (quality 'client-out)]
		  [out (quality 'mudsocket-out)]
		  [in (quality 'mudsocket-in)]
		  [parser (quality 'client-parser)]
		  [sender (quality 'client-sender)])
	     (cond
	       [(port-closed? in)
		(set! connections (remove thing connections))]
	       [(byte-ready? in)
		(with-handlers
		    ([exn:fail:read?
		      (λ (exn)
			(log-warning "Connection issue: ~a" exn)
			(close-input-port in)
			(close-output-port out)
			(set! connections
			      (remove thing connections)))]
		     [exn:fail:network:errno?
		      (λ (exn)
			(log-warning "Connection issue: ~a" exn)
			(close-input-port in)
			(close-output-port out)
			(set! connections
			      (remove thing connections)))])
		  (let ([line-in (read-line in)])
		    (cond [(string? line-in)
			   (parser (string-trim line-in))]
			  [(eof-object? line-in)
			   (close-input-port in)
			   (close-output-port out)
			   (set! connections
				 (remove thing connections))])))])
	     (when (> (string-length out-buffer) 0) (schedule sender))))
	 connections)
	(when (tcp-accept-ready? listener) (accept-connection state))
	(schedule tick)
	state))
    load))
```


#### parser {#parser}

```racket
#lang racket

(require uuid)

(require "./engine.rkt"
	 "./commands/move.rkt")

(provide client-login-parser
	 client-parser
	 client-sender)

(define (client-sender thing)
  (lambda (R)
  (let* ([name (name thing)]
	 [quality (quality-getter thing)]
	 [set-quality! (quality-setter thing)]
	 [message (quality 'client-out)]
	 [out (quality 'mudsocket-out)])
    (log-debug "Sending ~a a message:\n   ~a" name
	       (cond
		 [(> (string-length message) 60)
		  (format "~a..." (substring message 0 60))]
		 [else message]))
    (with-handlers ([exn? (lambda (exn) (log-warning "Issue sending message to client: ~a" exn))])
      (display
       (format
	(cond
	  [(eq? #\newline (last (string->list message))) "~a"]
	  [else "~a\n"]) message) out)
      (flush-output out))
    (set-quality! 'client-out ""))
    R))


(define (client-login-parser thing)
  (define quality (quality-getter thing))
  (define set-quality! (quality-setter thing))
  (define add-to-out ((string-quality-appender thing) 'client-out))
  (define mud (thing (λ (thing) (thing-mud thing))))
  (define schedule (car mud)) (define state (cdr mud))
  (define login-stage 0)
  (lambda (line)
    (log-debug "Received the following login line from ~a:\n   ~a"
	       (name thing) line)
    (let ([reply ""])
	(cond
	  [(= login-stage 0)
	   (set-quality! 'user-name line)
	   (rename! thing line)
	   ; account services
	   (cond [((hash-ref (mud-hooks state) 'account?) line)
		  (set! reply (format "There's a extant account for ~a. If it's yours, enter the password and press ENTER. Otherwise, disconnect [and reconnect]." line))
		  (set! login-stage 1)]
		 [else
		  (let ([pass (substring (uuid-string) 0 8)])
		    (set-quality! 'pass pass)
		    ((hash-ref (mud-hooks state) 'create-account) line pass)
		    (set! reply (format "There's no account named ~a. Your new password is\n\n~a\n\nPress ENTER when you're ready to log in." line pass)))
		  (set! login-stage 9)])]
	  [(= login-stage 1)
	   (cond
	     [(string=? (hash-ref ((hash-ref (mud-hooks state) 'account)
				   (quality 'user-name)) 'pass)
			line)
	      (set! reply "Correct. Press ENTER to complete login.")
	      (set! login-stage 9)]
	     [else (set! reply "Incorrect. Type your [desired] user-name and press ENTER.") (set! login-stage 0)])]
	  [(= login-stage 9)
	   (set-quality! 'client-parser (client-parser thing))
	   (let ([hooks (mud-hooks state)])
	     ((hash-ref hooks 'move) thing ((hash-ref hooks 'room) 'oru-valley/oru-oru-settlement))
	     ((hash-ref hooks 'tune-in) "cq" thing))
	   (add-to-out "You've been moved into the Crossed Candles Inn. Take a \"look\" around, and \"move\" or directly input exit names. You may chat with the \"cq\" command. Please remember this project is in the earliest stages of development.")])
	(when reply (add-to-out reply)))))

(define parse-args
  (lambda (args)
  ; before parsing arguments, take any elements (an element which starts with -- and has =") until (an element that ends with ") and join them together.
    (define results (make-hash))
    (map
     (lambda (arg)
       (cond
	 [(and (> (string-length arg) 2)
	       (string=? (substring arg 0 2) "--"))
	  (let ([sparg (string-split arg "=")])
	    (hash-set! results (substring (car sparg) 2) (cdr sparg)))]
	 [(string=? (substring arg 0 1) "-")
	  (map (lambda (char)
		 (hash-set! results char #t))
	       (string->list (substring arg 1)))]
	 [else (hash-set! results 'line
			  (cond [(hash-has-key? results 'line)
				 (append (hash-ref results 'line)
					 (list arg))]
				[else (list arg)]))]))
     args)
    (when (hash-has-key? results 'line) (hash-set! results 'line (string-join (hash-ref results 'line))))
    results))

(define (client-parser thing)
  (define quality (quality-getter thing))
  (define set-quality! (quality-setter thing))
  (define add-to-out ((string-quality-appender thing) 'client-out))
  (λ (line)
    (let ([reply ""]
	  [commands (quality 'commands)]
	  [location (quality 'location)])
      (log-debug "Received the following line from ~a:\n   ~a" (name thing) line)
      (when (> (string-length line) 0)
	(let* ([spline (string-split line)]
	       [input-command (car spline)] [args (parse-args (cdr spline))])
	  (cond [(hash-has-key? commands input-command)
		   ((hash-ref commands input-command) args)]
		[(and location (hash-has-key? ((quality-getter location) 'exits) (string->symbol input-command)))
		((move thing) (hash 'line input-command))]
		[(member input-command (quality 'channels))
		 (when (hash-has-key? args 'line)
		   ((hash-ref (mud-hooks (cdr (thing (lambda (t) (thing-mud t))))) 'broadcast)
		    input-command thing
		    (hash-ref args 'line)))]
		[else (set! reply "Invalid command.")])))
      (when reply (add-to-out reply)))))
```


#### recipes {#recipes}

```racket
#lang racket
(provide
 setup-stringy-quality-value
 setup-listy-quality-value
 std-or-qual
	 area
	 area/outdoors
	 area/outdoors/fort
	 area/outdoors/road
	 area/outdoors/river
	 area/outdoors/rural-road
	 area/outdoors/urban-district
	 area/outdoors/urban-street
	 area/outdoors/village
	 area/room
	 area/room/castle
	 area/room/inn
	 area/room/store
	 lookable
	 object
	 person
	 person/human
	 person/human/innkeep
	 person/ghost)

(define (setup-stringy-quality-value
	 std-qual
	 qual
	 append-qual
	 [separator " "])
  (cond
    [qual
     (cond [append-qual
	    (format "~a~a~a"
		    std-qual
		    separator
		    qual)]
	   [else qual])]
    [else std-qual]))

(define (setup-listy-quality-value
	 std-qual
	 qual
	 append-qual)
  (cond
    [qual
     (cond [append-qual
	    (append qual std-qual)]
	   [else qual])]
    [else std-qual]))

(define (std-or-qual
	 std-qual
	 qual)
  (setup-stringy-quality-value
   std-qual qual #f))


(define (area
	 #:name [name #f]
	 #:append-name [append-name #f]
	 #:nouns [nouns #f]
	 #:adjectives [adjectives #f]
	 #:description [description #f]
	 #:append-description [append-description #f]
	 #:exits [exits #f]
	 #:contents [contents #f]
	 #:actions [actions #f]
	 #:trivia [trivia #f])
  (λ (make)
    (let ([std-name "area"]
	  [std-description "This is an area."])
    (make
     (setup-stringy-quality-value std-name name append-name ", ")
     #:nouns nouns
     #:adjectives adjectives
     #:qualities
     (list (cons 'exits
		 (cond [exits (make-hash exits)] [else (make-hash)]))
	   (cond [description (cons 'description (setup-stringy-quality-value std-description description append-description))]
		 [else #f])
	   (cons 'contents
		 (cond [contents contents] [else (list)]))
	   (cond [trivia (cons 'trivia trivia)]
		 [else #f])
	   (cond [actions (cons 'actions actions)]
		 [else #f]))))))

(define (area/outdoors
	 #:name [name #f]
	 #:nouns [nouns #f]
	 #:adjectives [adjectives #f]
	 #:description [description #f]
	 #:exits [exits #f]
	 #:contents [contents #f]
	 #:actions [actions #f]
	 #:trivia [trivia #f])
  (area #:name name  #:description description
	#:exits exits #:contents contents #:actions actions #:trivia trivia))

(define area/outdoors/fort
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area/outdoors #:name name #:description description
	   #:exits exits #:contents contents #:actions actions
	   #:trivia trivia)))
(define (area/outdoors/river
	 #:name [name #f]
	 #:nouns [nouns #f]
	 #:adjectives [adjectives #f]
	 #:description [description #f]
	 #:exits [exits #f]
	 #:contents [contents #f]
	 #:actions [actions #f]
	 #:trivia [trivia #f])
  (let ([std-name "river"]
	[std-description "This is a river."])
    (area/outdoors
     #:name (std-or-qual std-name name)
     #:nouns nouns
     #:adjectives adjectives
     #:description std-or-qual std-description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia trivia)))
(define area/outdoors/road
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area/outdoors #:name name
	    #:nouns nouns  #:adjectives adjectives #:description description
	      #:exits exits #:contents contents
	      #:actions actions #:trivia trivia)))

(define area/outdoors/rural-road
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area/outdoors/road #:name name
	    #:nouns nouns  #:adjectives adjectives #:description description
	      #:exits exits #:contents contents
	      #:actions actions #:trivia trivia)))
(define area/outdoors/urban-district
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area/outdoors #:name name #:description description
	   #:exits exits #:contents contents #:actions actions
	   #:trivia trivia)))
(define area/outdoors/urban-street
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area/outdoors #:name name #:description description
	   #:exits exits #:contents contents #:actions actions
	   #:trivia trivia)))
(define area/outdoors/village
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (let ([std-name "village"] [std-nouns '("village")])
      (area/outdoors #:name (cond [name name][else std-name])
	    #:nouns (cond [nouns nouns][else std-nouns])
	    #:description description
	    #:exits exits #:contents contents #:actions actions
	    #:trivia trivia))))
(define area/room
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (area #:name name #:description description
	  #:exits exits #:contents contents #:actions actions #:trivia trivia)))
(define area/room/castle
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (let ([std-name "castle"] [std-nouns '("castle")])
      (area/room #:name (cond [name name][else std-name])
	    #:nouns (cond [nouns nouns][else std-nouns])
	    #:description description
	    #:exits exits #:contents contents #:actions actions
	    #:trivia trivia))))
(define area/room/inn
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (let ([std-name "inn"] [std-nouns '("inn")])
      (area/room #:name (cond [name name][else std-name])
	    #:nouns (cond [nouns nouns][else std-nouns])
	    #:description description
	    #:exits exits #:contents contents #:actions actions
	    #:trivia trivia))))

(define area/room/store
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (let ([std-name "store"] [std-nouns '("store")])
      (area/room #:name (cond [name name][else std-name])
	    #:nouns (cond [nouns nouns][else std-nouns])
	    #:description description
	    #:exits exits #:contents contents #:actions actions
	    #:trivia trivia))))


(define lookable
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f]
	   #:actions [actions #f] #:trivia [trivia #f])
    (lambda (make)
      (make name
	    #:nouns nouns  #:adjectives adjectives
	    #:qualities
	    (list
	     (cond [description (cons 'description description)]
		   [else #f])
	     (cond [actions (cons 'actions actions)]
		   [else #f])
	     (cond [trivia (cons 'trivia trivia)]
		   [else #f]))))))
(define object
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	   #:description [description #f] #:mass [mass #f]
	   #:contents [contents #f] #:actions [actions #f]
	   #:trivia [trivia #f])
    (lambda (make)
      (let ([std-name "object"] [std-nouns '("object")])
	(make (cond [name name][else std-name])
	      #:nouns (cond [nouns nouns][else std-nouns])
	      #:qualities
	      (list
	       (cond [description (cons 'description description)]
		     [else #f])
	       (cons 'contents
		     (cond [contents contents] [else (list)]))
	       (cond [trivia (cons 'trivia trivia)]
		     [else #f])
	       (cons 'mass (cond [mass mass][else 1]))
	       (cond [actions (cons 'actions actions)]
		     [else #f])))))))












(define person
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f]
	   #:contents [contents #f] #:actions [actions #f]
	   #:mass [mass #f] #:trivia [trivia #f])
    (lambda (make)
      (make name
	    #:nouns nouns
	    #:adjectives adjectives
	    #:qualities
	    (list
	     (cond [description (cons 'description description)]
		   [else #f])
	     (cons 'contents
		   (cond [contents contents] [else (list)]))
	     (cond [actions (cons 'actions actions)]
		   [else #f])
	     (cond [mass (cons 'mass mass)]
		   [else #f])
	     (cond [trivia (cons 'trivia trivia)]
		   [else #f]))))))

(define person/human
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f]
	   #:contents [contents #f] #:actions [actions #f]
	   #:trivia [trivia #f] #:mass [mass #f])
    (person #:name name
	    #:nouns nouns  #:adjectives adjectives #:description description
	    #:contents contents #:actions actions
	    #:mass 1 #:trivia trivia)))
(define person/human/innkeep
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f]
	   #:contents [contents #f] #:actions [actions #f]
	   #:trivia [trivia #f] #:mass [mass #f])
    (person/human #:name name
	    #:nouns nouns  #:adjectives adjectives #:description description
	    #:contents contents #:actions actions
	    #:mass 1 #:trivia trivia)))
(define person/ghost
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f]
	   #:contents [contents #f] #:actions [actions #f]
	   #:trivia [trivia #f])
    (person #:name name
	    #:nouns nouns  #:adjectives adjectives
	   #:description description
	    #:contents contents #:actions actions
	    #:trivia trivia)))
```


#### talker {#talker}

```racket
#lang racket

(require "./engine.rkt")
(provide talker)
(define (talker [chans '("cq")])
  (define channels (make-hash
		    (map
		     (lambda (channel) (cons channel (list)))
		     chans)))
  (λ (state)
    (define (add-listener! name listener)
      (let ([listeners (hash-ref channels name)])
	(hash-set! channels name (append (list listener) listeners))
	((quality-setter listener)
	 'channels (append (list name) ((quality-getter listener) 'channels)))))
    (define (remove-listener! name listener)
      (let ([listeners (hash-ref channels name)])
	(hash-set! channels name (remove listener listeners))))
    (define (broadcast chan speaker message)
      (let ([broadcast-message (format "(~a) ~a: ~a"
				       chan
				       (name speaker)
				       message)])
	(when (string=? chan "cq")
	     (with-output-to-file "talker-log.rktd"
	       (λ () (printf (format "~a\n" broadcast-message)))
	       #:exists 'append))
	(map
	 (λ (listener)
	   (define add-to-out
	     ((string-quality-appender listener) 'client-out))
	   (add-to-out broadcast-message))
       (hash-ref channels chan))))
    (define (tune-in chan listener)
      (define
	tune-in (λ (chan listener)
		  (unless (member
			   chan
			   ((quality-getter listener) 'channels))
		    (add-listener! chan listener))))
      (cond
	[(list? chan) (for-each (λ (chan) (tune-in chan listener))
				chan)]
	[(string? chan)
	 (tune-in chan listener)]))
  (define (tune-out chan listener)
    (define
      tune-out (λ (chan listener)
		 (remove-listener! chan listener)))
    (cond
      [(list? chan) (for-each (λ (chan) (tune-out chan listener))
			      chan)]
      [(string? chan)
       (tune-out chan listener)]))
    (let ([hooks (mud-hooks (cdr state))])
      (hash-set! hooks 'broadcast broadcast)
      (hash-set! hooks 'tune-in tune-in)
      (hash-set! hooks 'tune-out tune-out))
    state))
```


#### utilities {#utilities}

<div class="ox-hugo-toc toc local">
<div></div>

- [strings](#strings)

</div>
<!--endtoc-->


##### strings {#strings}

```racket
#lang racket

(provide filter-multiple-word-strings-from-strings
	 force-stringy-list
	 merge-stringy-lists
	 oxfordize-list
	 str-and-sym-list-joiner)

(define (filter-multiple-word-strings-from-strings strings)
  (filter values
	  (map
	   (lambda (str)
	     (cond
	       [(> (length (string-split str)) 1)
		str]
	       [else #f]))
	   strings)))

(define (oxfordize-list strings)
  (cond
    [(null? strings)
     (log-warning "Tried to oxfordize an empty list.")]
    [(null? (cdr strings))
     (car strings)]
    [(null? (cddr strings))
     (string-join strings " and ")]
    [else
     (string-join strings ", "
		  #:before-first ""
		  #:before-last ", and ")]))

(define str-and-sym-list-joiner
    (lambda (strings [sep ""])
      (string->symbol
       (string-join
	(map
	 (lambda (string)
	   (cond
	     [(string? string)
	      string]
	     [(symbol? string)
	      (symbol->string
	       string)]))
	 strings)
	sep))))

(define (force-stringy-list strings)
    (cond [(list? strings) strings] [(pair? strings) (list (car strings) (cdr strings))]
	  [(string? strings) (list strings)] [else (list)]))

(define (merge-stringy-lists list1 [list2 #f])
  (filter values
	  (force-stringy-list
	   (append
	    (force-stringy-list list1)
	    (cond [list2 (force-stringy-list list2)] [else (list)])))))
```


### world code {#world-code}

<div class="ox-hugo-toc toc local">
<div></div>

- [main](#main)
- [recipes](#recipes)
- [map](#map)
    - [main](#main)
    - [recipes](#recipes)
    - [Oru valley](#oru-valley)

</div>
<!--endtoc-->


#### main {#main}

```racket
#lang racket

(require "map/main.rkt")

(provide teraum-map)
```


#### recipes {#recipes}

```racket
#lang racket

(require (prefix-in basic/ "../recipes.rkt"))

(provide teraum-trivia
	 (prefix-out teraum/ wintertyg-tree)
	 (prefix-out teraum/ inn)
	 (prefix-out teraum/ rural-road)
	 (prefix-out teraum/ room)
	 (prefix-out teraum/ area/human-settlement)
	 (all-from-out "../recipes.rkt"))

(define teraum-trivia
  '("Teraum was created around 2001 by emsenn, though at the time it was called Canland, because the world existed inside of a soup can."
    "There's no evidence that the world of Teraum does not exist inside a soup can."
    "Teraum is a portmanteau of \"Terra, with thaums,\" or, \"Earth, with magic.\""
    "Teraum's calendar year is 365.25 days long, just like Earth's."
    "Teraum has 12 months of 30 days, with several holidays located between months throughout the year."
    "The first sentient species on Teraum were the goblins, who escaped from the Undermuck in the Worldkeep."
    "Teraum was created as a garden for the gods, adjacent to the Worldkeep, where their various magic works and creatures were housed."))

(define wintertyg-tree
  (basic/object
   #:name "Wintertyg tree"
   #:description "This is a young spruce tree, mounted in a copper base, with small decorations hung from its branches: little wooden figures, twisted metal birds, and so on. It is a traditional Wintertyg tree!"
   #:trivia '("Though equivalent to Earth's Christmas, Wintertyg occurs on the equivalent of January 20th."
	      "Wintertyg is a human holiday observed on the 20th of Sleeting. Typically, families and friends exchange gifts.")
   #:actions '((1 . "The Wintertyg tree briefly shimmers with festive cheer."))))


(define inn
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (let ([std-contents (list wintertyg-tree)])
      (basic/area/room/inn
       #:name name
       #:description description
       #:exits exits
       #:contents (cond [contents (append contents std-contents)][else std-contents])
       #:actions actions
       #:trivia trivia))))

(define area/human-settlement
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (basic/area/outdoors
       #:name name
       #:description description
       #:exits exits
       #:contents contents
       #:actions actions
       #:trivia trivia)))

(define rural-road
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (basic/area/outdoors/rural-road
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia trivia)))

(define outdoors
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (basic/area/outdoors
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia trivia)))


(define room
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (basic/area/room
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia (cond [trivia (append trivia teraum-trivia)][else teraum-trivia]))))

(define goblin
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (define goblin-trivia
      (append teraum-trivia
      '("Goblins were the second sentient species to settle Teraum, after giant spiders."
	"On the 2nd of Sleeting, 29395bB, the goblin Uzdar Brag was wandering the Undermuck and found a breach into the Widewoods. He returned with his tribe and they began to settle the region.")))
    (basic/person
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia (cond [trivia (append trivia goblin-trivia)][else goblin-trivia]))))

(define giant-spider
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (define giant-spider-trivia
      (append teraum-trivia
      '("Giant spiders were the first sentient species to settle Teraum, after an earthquake caused a breach in the walls of the Worldkeep and let them out of the Knotted Hell.")))
    (basic/person
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia (cond [trivia (append trivia giant-spider-trivia)][else giant-spider-trivia]))))

(define cat
  (lambda (#:name name #:nouns [nouns #f] #:adjectives [adjectives #f]
	    #:description [description #f] #:exits [exits #f]
	   #:contents [contents #f] #:actions [actions #f] #:trivia [trivia #f])
    (define cat-trivia
      (append teraum-trivia
      '("No one is quite sure when cats came to Teraum, or where they came from.")))
    (basic/person
     #:name name
     #:description description
     #:exits exits
     #:contents contents
     #:actions actions
     #:trivia (cond [trivia (append trivia cat-trivia)][else cat-trivia]))))
```


#### map {#map}


##### main {#main}

```racket
#lang racket

(require (prefix-in oru-valley/ "./oru-valley/main.rkt"))

(provide teraum-map
	 (all-from-out "./oru-valley/main.rkt"))

(define teraum-map
  (make-hash
   (list
    (cons 'oru-valley/oru-oru-settlement oru-valley/oru-oru-settlement))))
```


##### recipes {#recipes}

```racket
#lang racket

(require "../recipes.rkt")

(provide (all-from-out "../recipes.rkt"))
```


##### Oru valley {#oru-valley}


###### main {#main}

```racket
#lang racket


(require "oru-oru-settlement.rkt")

(provide
 (all-from-out "oru-oru-settlement.rkt"))
```


###### recipes {#recipes}

```racket
#lang racket

(require "../recipes.rkt")

(provide (all-from-out "../recipes.rkt"))

(define
  north-woodlands-trivia
  '("Before humans stopped abusing Teraum, a lot of the North Woodlands were cleared and used as grazing land for their livestock."))
```


###### Oru Oru Settlement {#oru-oru-settlement}

```racket
#lang racket

(require "./recipes.rkt")

(provide oru-oru-settlement)


(define oru-oru-settlement
  (teraum/area/human-settlement
   #:name "Oru Oru settlement"
   #:description "This is the settlement of the Oru Oru community. There are eight domed structures covered in birch bark."
   #:exits '()))
```


## logs {#logs}

<div class="ox-hugo-toc toc local">
<div></div>

- [2020](#2020)
    - [2020-07 July](#2020-07-july)
        - [2020-07-05 Sunday](#2020-07-05-sunday)

</div>
<!--endtoc-->


### 2020 {#2020}


#### 2020-07 July {#2020-07-july}


##### 2020-07-05 Sunday {#2020-07-05-sunday}

<span class="timestamp-wrapper"><span class="timestamp">[2020-07-05 Sun 20:02]</span></span>
I'm going to move all the code I have for my MUD into an org-mode file, to make planning it a bit easier.