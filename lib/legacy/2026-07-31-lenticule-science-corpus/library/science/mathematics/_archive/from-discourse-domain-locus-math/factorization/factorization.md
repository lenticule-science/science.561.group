---

title: "Factorization"
description: "Factorization is breaking a process into steps. If getting from A to C always passes through B, then the process A → C factors through B. It decomposes into A → B followed by B → C."
date-created: 2026-03-29
defines:
  - "Factorization"
  - "factors-through"
  - "factor"
requires: [morphism, composition]
---

Factorization is breaking a process into steps. If getting from A to C always passes through B, then the process A → C factors through B. It decomposes into A → B followed by B → C.

In arithmetic, factoring 12 gives 2 × 2 × 3 — the number broken into pieces that multiply to rebuild it. In category theory, a morphism f: A → C factors through B when there exist morphisms g: A → B and h: B → C such that f = h ∘ g. B is the intermediate that the process must pass through.

Factorization reveals hidden structure. If every instance of a process passes through the same intermediate, that intermediate is doing real work — it is a necessary waypoint, not an accident. Click-through rate factors through impression and conversion rate because every click requires first being seen (impression) and then acting (conversion).

When this library uses `factors-through` as a predicate, the subject is a process and the object is an intermediate it must pass through on the way to its result.
