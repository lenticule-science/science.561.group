---
date: 2020-01-19
authors:
  - "[[emsenn]]"
title: The anatomy of things
description: In this post I'd like to explain how things (in-game objects) work.
---
##   
Introduction

In this post I'd like to explain how _things_ (in-game objects) work. (This will also, incidentally, be a short tutorial on _lambda calculus_ and _closures_.)

In the language of game design, _Racket-MUD_ uses a type [“entity component system,”](https://en.wikipedia.org/wiki/Entity_component_system) more or less. I call it _quality of things_, and developed it mostly in the isolation of solitary hacking, so there are some differences.

Everything a user interacts with inside _Racket-MUD_ is a _thing_, and every _thing_ has _qualities_, which define its capabilities.

From the user's perspective, a _thing_ is a loaf of bread, a field, a starship, or even abstract _things_ like jealousy: it all depends on the sort of MUD being implemented.

From the engine's perspective, a _thing_ is a function, into which functions are thrown, and out of which comes a function.

---

## Enclosing variables

Let's forget about _things_ for a moment and look at some more generic code.

```
    (define alef 7)
```

What's this do? It defines `alef` as `7`. Simple enough.

```
    (define bet
      (λ () 7))
```

What does this one do? It defines `bet` as a function, that returns `7`. (`(λ () 7)` breaks down to “make a function (`λ`) that takes zero arguments (`()`) and returns `7`.“)

By-the-by, that `λ` symbol? That's the lowercase “lambda” character from the Greek alphabet; it's used in a few programming languages (and branches of mathematics) to mean “a function.”

```
    alef  ; -> 7
    bet   ; -> <#procedure:bet>
    (bet) ; -> 7
```

Calling `alef` returns `7`, but calling `bet` returns a procedure – so, we have to call that procedure, by doing `(bet)`: and now we get our `7`.

Pretty simple. Let's build on this.

```
    (define gimel
      (λ ()
        (define num 7)
        (λ () num)))
```

Less simple: there are two of those `λ` things. We know that calling `gimel` will return a function: let's look at what that function actually would contain:

```
    (define num 7)
    (λ () num)
```

So, first, it's defining `num` as `7` and then… it returns a function, that we can see, takes no arguments, and returns `num`. So how do we use `gimel`?

```
    gimel     ; -> <#procedure:gimel>
    (gimel)   ; -> <#procedure>
    ((gimel)) ; -> 7
```

Well, we've certainly added complexity, but there hasn't been any new capabilities added.

```
    (define dalet
      (λ ()
        (define num 7)
        (λ () (+ 1 num))))
```

Here, we've replaced returning num with returning `(+ 1 num)`.

So, running these we get:

```
    dalet     ; <#procedure:dalet>
    (dalet)   ; <#procedure>
    ((dalet)) ; 8
```

## Manipulating Enclosed Variables

Now we're getting somewhere. Let's add some more capabilities. Here, we're going to make it so that the procedure returned by the outer-function is capable of taking an argument; that'll be added (`+`) to `num`.

```
    (define he
      (λ ()
        (define num 7)
        (λ (x) (+ x num))))
```

So now we can do:

```
    he        ; <#procedure:he>
    (he)      ; <#procedure>
    ((he) 1)  ; 8
    ((he) 10) ; 17
```

Now that's something! Let's rename the function we've been working on to make what it does more clear.

```
    (define add-to-seven
      (λ ()
        (define seven 7)
        (λ (x) (+ x seven))))
```

Maybe now the point of _why_ I've done this will be a little more clear: we've created a bit of data, `seven`, and it's held inside the function. Basically, all we can do is ask the function, “what would happen if we added _x_ to 7?”

Let's make it a bit more general.

## Passing Lambdas Around

```
      (define do-to-seven
        (λ ()
          (define seven 7)
          (λ (f) (f seven))))
```

We've changed the returned function here: now it doesn't take `x` and return the result of `(+ x seven)`. It takes `f` and returns the result of `(f seven)`.

You might be able to infer that `f` is intended to be a function, not a number, and that it needs to take one argument, and that argument will be seven. Let's play around with this.

```
    do-to-seven ; <#procedure:do-to-seven>
    (do-to-seven) ; <#procedure>
```

Y'know these nested parantheses aren't always that easy to read. Let's switch up the style a bit.

```
    (define seven-doer (do-to-seven))
    seven-doer ; <#procedure>
```

Alright – now we can directly access the enclosed function, `(λ (f) (f seven))`, with `seven-doer`. Let's move on.

```
    (seven-doer
     (λ (S) S)) ; -> 7
```

What does this do? It calls `seven-doer`, passing it a lambda function that takes one argument, `S`, and returns `S`. This returns `7`. Let's see how, by looking how the statement **_expands_**. First, the code above turns into, more-or-less:

```
    ((λ (f) (f seven)) (λ (S) S))
```

Ew. Hard to read, but try to follow the parantheses. The whole thing is one statement, with two parts: the first is a lambda function that takes `f` and returns `(f seven)`, and the second is a lambda function that takes `S` and returns `S`.

The first part of the statement is treated as a function, and the second part is its argument, so the next step from here is to pass the second part into the first part. We get to

```
    ((λ (S) S) seven)
```

(That is, `(f seven)` when `f` is `(λ (S) S)`.)

So, from here, we pass `seven` into the lambda function, which just returns whatever `seven` is, in this case, `7`.

Phew! That was a lot. The point is, now, we have a function that we can ask, “Hey, show me what would happen if I do the following to 7…“

…and “the following” can be just about anything you think of. Like, say, doubling it.

```
    (define double
      (λ (x) (* x 2))) ; -> <#procedure:double>
    
    (do-to-seven double) ; -> 14
```

Now, this is a lot of semantic overhead for what is essentially `(* 7 2)`. but let's see how this relates to _Racket-MUD_'s _things_.

## Things

```
    (define thing-maker
      (λ (name)
        (let ([thing (make-hash
    		  (list
    		   (cons 'name name)))])
          (λ (f) (f thing)))))
```

_(This isn't actually the code for making a thing, just a simple version for explaining the concepts.)_

Let's pull this apart:

`thing-maker` is a function that takes one argument, `name`, creates a hash-table called `thing` to store the name, and returns a function that takes one argument, `f`, and returns the result of `(f thing)`.

```
    (define bob (thing-maker "Bob")) ; <#procedure>
    (bob (λ (thing) (hash-ref thing 'name))) ; "Bob"
```

So this defines `bob` as the result of `(thing-maker "Bob")`: a procedure, `(λ (f) (thing f)`, where `thing` is a a hash-table of the key `'name` to the value `"Bob"`.

Essentially, `bob`, the variable, is something into which we can throw queries about Bob, the _thing_.

So if we give the function `(λ (thing) (hash-ref thing 'name)))` to `bob` – or any _thing_ – we're basically asking that thing, “Hey, what's your name?”

And the thing will look at itself, and say what it's name is – `"Bob"`.

In this way, we're able to arbitrarily define new _qualities_ for the thing (by adding them to its hash-table), or manipulate them in new wyas, without having to extend the core functionality of the _thing_, which is, essentially, just making a hash-table and returning `(λ (f) (f hash-table))`.

And that's how **_things_** work!
