#lang pollen

◊(define entry-date "2020-05-20-12-44")

In this log entry I'd like to plan out the core code that'll run behind these entries.

The code is inspired heavily by my experience trying to make a MUD engine, only the game world, instead of being built by preconfigured objects and player interaction, will be created by a linear sequence of procedure calls. (Which is how it works under-the-hood in my MUD, too.)

In my MUD, there are /things/ with /qualities/, and then /events/ occur that change those things.

Here, the same thing will happen!

So, I can use a lot of the same ideas - but without needing a central MUD handler for intaking events from a bunch of multiple sources. (At least, that's how I picture it right now.

This means I need to implement the concept of a thing, and a procedure for making a thing.

(I'm going to write that below, but I don't think it will render in the published entry, with how I'm currently using Pollen.)

◊(define recorded-things (list))
◊(define archived-things (list))

◊(struct thing (name grammar qualities) #:mutable)

◊(define (record-thing name #:grammar [grammar #f] #:qualities [qualities #f])
(let ([thing (thing name (cond [grammar (make-hash (filter values grammar))][else (make-hash)]) (cond [qualities (make-hash (filter values qualities))][else (make-hash)]))]) (set! recorded-things (append recorded-things (list thing))) (format "Recorded thing named ~a [~a recorded things]" name (length recorded-things))))

I should mention - I don't think I have in this log - that my first priority is functions for recording what gets donated to me and what I give back out. (I figure an inventory system is a good place to start for something like... whatever this is.

So, we need the inventory - itself a thing, and procedures for receiving stuff into the inventory - and giving it back out.

Receiving stuff creates the stuff that's received, as far as its record - hmm maybe "create" is the wrong word to use.

Maybe it should be "record-thing".

So, receiving stuff creates a new record of a thing, and giving it away destroys the record - I guess implicitly by moving it out of any other thing's contents.

So our things...

◊record-thing[#:qualities '((contents . (list)))]{"Brick Box Community Room"}

That's a thing with a quality "contents" but there's no way provided to interact with it: get contents from something, add something to contents, remove it from contents - and c-c-c-c-combo procedures like remove from one thing's contents and add it to another's.

◊(define (get-contents thing) (get-quality thing 'contents))

◊(define (get-quality thing quality) (with-handlers ([exn:fail:contract? (λ (exn) (format "Tried to get non-existent ~a quality from ~a" quality (thing-name thing)))]) (hash-ref (thing-qualities thing) quality)))

◊(define (set-quality! thing quality value) (hash-set! (thing-qualities thing) quality value))

◊(define (set-contents! thing contents) (set-quality! thing 'contents contents))

◊(define (add-to-contents! thing item) (set-contents! thing (append (get-contents thing) item)))

I'll also need procedures for searching for things, so that I can actually reference things - right now it can just be "does the name match?" and error if there's too many results.

◊(provide recorded-things archived-things thing record-thing get-contents get-quality set-quality! set-contents!)