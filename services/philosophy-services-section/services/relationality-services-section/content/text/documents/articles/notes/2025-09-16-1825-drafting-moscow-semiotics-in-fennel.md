---
title: Babble, 2025-09-16 18:25 – drafting Moscow-semiotics-in-Fennel
author: emsenn
date-created: 2025-09-16
type: babble
status: draft
keywords:
  - babble
  - semiotics
  - fennel
publish_to:
  - emsenn-net
aliases:
  - 2025-09-16-1825-drafting-moscow-semiotics-in-fennel
publish-to:
  - emsenn-net
description: In another babble I talked about Moscow-school semiotics, and how it might describe more than just one of my paracosmic worlds, and am now thinking about what a world made from Moscow-school semiotics might look like.
tags:
  - babble
  - semiotics
  - fennel
---

In another babble I talked about Moscow-school semiotics, and how it might describe more than just one of my paracosmic worlds, and am now thinking about what a world made from Moscow-school semiotics might look like. I'm not sure the literature itself is the best for laying out the structure of such a world, though, at least not in an easy-to-convert-into-code form. Nevertheless, it seems worth trying as a general concept.

To start with, I'm ignoring skinning, and asking, what structure do the interactions between the player and the world need to have, for those interactions to be describable as within the semiosphere, a world described by Moscow-school semiotics?

Earlier, I described a Moscow-world, having at least a few things, borrowed from [Wikipedia](https://en.wikipedia.org/wiki/Moscow_school_of_semiotics):

- semiosphere
  - core
  - periphery
  - boundary
- text
- memory
- autocommunicating
- code

But, what is the semosphere, in a form that code (and MUD interfaces) can use?

We know that it has codes, texts, and memory - that it has a core and periphery, is bounded, and that some of it autocommunicates.

At a minimum, that means our semiosphere is an object with the following attributes:

- codes
- core
- periphery
- texts
- memory
- boundary

And this object must recognize these attributes and give them behaviors, to be usable in a MUD system. That intuition seems important to me, somewhere in the vague ontologizing in my head, but I can't quite pin down why exactly right now.

There is enough information here to sketch out the shape of a semiosphere-like object using a pseudo-Fennel code.

```fennel
(local semiosphere
  {:codes []
   :core []
   :periphery []
   :texts []
   :memory []
   :boundary []})
```

Because Fennel's tables of tables have to adhere to the table shape, the identities I describe above wouldn't work all that well. These arrays would have to be arrays of functions, and the semiosphere itself would have to be a function. Along that lines, this might give us the prototype:

```fennel
(local semiosphere {:codes (fn [semiosphere] [])
                    :core (fn [semiosphere] [])
                    :periphery (fn [semiosphere] [])
                    :texts (fn [semiosphere] [])
                    :memory (fn [semiosphere] [])
                    :boundary (fn [semiosphere] [])})
```

And while would work on its own, it's not Fennelly enough for my taste. Fennel leaves a lot of Lua compatible as-is, but I find, for my own sanity, that it is better to structure code in FNLSpeak wherever possible. To do that, we would want to make the table via a local function that acts as factory.

```fennel
(fn make-semiosphere []
  {:codes (fn [semiosphere] [])
   :core (fn [semiosphere] [])
   :periphery (fn [semiosphere] [])
   :texts (fn [semiosphere] [])
   :memory (fn [semiosphere] [])
   :boundary (fn [semiosphere] [])})
```

That's a lot more Fennely, but still isn't quite as much as it could be: I want the semiosphere to be something both strings and symbols can be put into: so it might be something like:

```fennel
(fn semiosphere []
  {:codes (fn [semiosphere] [])
   :core (fn [semiosphere] [])
   :periphery (fn [semiosphere] [])
   :texts (fn [semiosphere] [])
   :memory (fn [semiosphere] [])
   :boundary (fn [semiosphere] [])})
```

And that is a good place to start - but, of course, it just describes how the semiohere looks, not how it actually interacts with the world. To do that, we need to define how these attributes have to behave: they need methods, etc.

I'm not sure exactly how to describe that, at this moment, but will give it a shot.

```fennel
(local codes [])

(fn add-code [code]
  (table.insert codes code))

(fn remove-code [code]
  (let [idx (index-of codes code)]
    (when idx
      (table.remove codes idx))))

(fn list-codes []
  codes)
```

For this example, `index-of` would be a helper function we wrote somewhere else, that finds the index of a code in the codes table, but I'm not worried about that right now. What we can see is that, in our Fennel version, the codes attribute has methods for adding, removing, and listing codes.

Similarly, we will want a functions that let us query and manipulate the other attributes of the semiosphere, but before that, we might want to give the semiosphere some more interesting things to map codes to.

I'm not thinking through any big-picture learnings here, I'm mostly just exploring this for fun.

Earlier, I said that the attributes need to behave and be recognized by the semiosphere, but I also think they need ways to behave that the semiosphere doesn't see, and vice versa - or, they must be represented in somewhat different worlds that the semiosphere can operate in. When we consider a semiosphere, semiosphere and code as tables, the things operating on them, and the things they operate on, we wind up with four types of structures that ~codes~ must exist within.

```text
 ~semiosphere~ and its ~codes~ represent the semiosphere.
 ~semiosphere~

 - sphere
 - codes
  - code
  - code
 - core
 - periphery
 - texts
  - text
  - text
 - memory
 - cha
 ~codes~ represent possible codes in the semiosphere.
 - semiosphere
 - code

 ~semiosphere~ and its ~codes~
 contrast with

 semiosphere and its spheres, where ~semiosphere~ does not represent a conceptual semantics, but instead actual things, actants
```

I lost my train of thought there, but it was leading toward something about how representing things in code doesn't automatically represent them in our own thought, but think I'm going to let that stew for a bit longer, and try another swing at it later.
