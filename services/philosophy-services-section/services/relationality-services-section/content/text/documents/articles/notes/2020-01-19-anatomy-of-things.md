---
title: Babble, 2020-01-19 – Anatomy of Things
author: emsenn
date-created: 2020-01-19
type: babble
status: draft
keywords:
  - babble
  - racket
  - mud
  - programming
publish_to:
  - emsenn-net
---

In this post I'd like to explain how things (in-game objects) work. (This will also, incidentally, be a short tutorial on lambda calculus and closures.)

In the language of game design, Racket-MUD uses a type “entity component system,” more or less. I call it quality of things, and developed it mostly in the isolation of solitary hacking, so there are some differences.

Everything a user interacts with inside Racket-MUD is a thing, and every thing has qualities, which define its capabilities.

From the user's perspective, a thing is a loaf of bread, a field, a starship, or even abstract things like jealousy: it all depends on the sort of MUD being implemented.

From the engine's perspective, a thing is a function, into which functions are thrown, and out of which comes a function.

Enclosing variables

Let's forget about things for a moment and look at some more generic code.

```scheme
(define alef 7)
```

What's this do? It defines `alef` as 7. Simple enough.

```scheme
(define bet
  (λ () 7))
```

What does this one do? It defines `bet` as a function, that returns 7. (`(λ () 7)` breaks down to “make a function (`λ`) that takes zero arguments (`()`) and returns 7.“)

By-the-by, that `λ` symbol? That's the lowercase “lambda” character from the Greek alphabet; it's used in a few programming languages (and branches of mathematics) to mean “a function.”

```scheme
alef  ; -> 7
bet   ; -> <#procedure:bet>
(bet) ; -> 7
```

Calling `alef` returns 7, but calling `bet` returns a procedure – so, we have to call that procedure, by doing `(bet)`: and now we get our 7.

Pretty simple. Let's build on this.

```scheme
(define gimel
  (λ ()
    (define num 7)
    (λ () num)))
```

Less simple: there are two of those `λ` things. We know that calling `gimel` will return a function: let's look at what that function actually would contain:

```scheme
(define num 7)
(λ () num)
```

So, first, it's defining `num` as 7 and then… it returns a function, that we can see, takes no arguments, and returns `num`. So how do we use `gimel`?

```scheme
gimel     ; -> <#procedure:gimel>
(gimel)   ; -> <#procedure>
((gimel)) ; -> 7
```

Well, we've certainly added complexity, but there hasn't been any new capabilities added.

```scheme
(define dalet
  (λ ()
    (define num 7)
    (λ () (+ 1 num))))
```

Here, we've replaced returning `num` with returning `(+ 1 num)`.

So, running these we get:

```scheme
dalet     ; <#procedure:dalet>
(dalet)   ; <#procedure>
((dalet)) ; 8
```

Now we're getting somewhere. Let's add some more capabilities. Here, we're going to make it so that the procedure returned by the outer-function is capable of taking an argument; that'll be added (`+`) to `num`.

```scheme
(define he
  (λ ()
    (define num 7)
    (λ (x) (+ x num))))
```

So now we can do:

```scheme
he        ; <#procedure:he>
(he)      ; <#procedure>
((he) 1)  ; 8
((he) 10) ; 17
```
