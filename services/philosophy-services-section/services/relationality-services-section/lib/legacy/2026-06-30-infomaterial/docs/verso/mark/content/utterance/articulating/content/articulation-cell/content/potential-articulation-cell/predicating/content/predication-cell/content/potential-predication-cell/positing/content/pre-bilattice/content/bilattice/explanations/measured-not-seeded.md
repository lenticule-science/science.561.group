# Measured, not seeded

The single idea this kernel turns on: **a cell's state is *measured* from what was given, never
*seeded* onto it.** This page is why that matters and how the code enforces it.

## You can't put a cell at a fixed point

The descent's job is to take a cell to a fixed point of a closure (`settle`, `brim`, …). A fixed point
is something you *reach*, by iterating until nothing changes — not something you stamp. So "seed the
cell with value X and iterate" is a category error when X is itself one of the fixed-point corners:
you've assumed the answer. The honest move is to record only what is *given*, and let the closure
measure where that lands.

## What's given is the token

An utterance is `[token, claim]`. The **token is given** — it's just there, an object handed in. The
**claim is claimed** — predicated of the token, but not yet made good. So a freshly articulated cell
already *has* one fact (a given token) and one open question (is the claim active?). Reading those
off:

- token given → the knowledge bit is set, witnessed by the token;
- claim not yet realized → the truth bit is **free** (no witness).

That reading is the value `[true, false]` — **potential**. Not seeded; *measured*.

```
math:  a cell with a given object sits at potential = ⟨1, 0⟩, the bit free where nothing is told
code:  posit.mjs — charge: { value: [true, false], evidence: [[subject], []] }   (subject = the given token)
```

## Absurd is reached, never seeded

The old kernel **stamped every cell absurd** (`[F,F]`) as a starting value — the lattice bottom, as
if every predication began from contradiction. That's exactly the seeding error: it puts the cell at a
corner (and ignores the given token). `posit` no longer does this. **Absurd is now only ever
*reached*** — it is what the meet produces under genuine contradiction:

```
math:  meetₖ(potential, active) = ⟨1∧0, 0∧1⟩ = ⟨0, 0⟩ = absurd
code:  meetK({left: potential, right: active}).value  →  [false, false]
```

Two tellings that assert opposite sides cancel to absurd. *That* is what absurd means — irreconcilable
— and you only land there by combining incompatible evidence, never by fiat.

## The empty utterance is malformed, not a ground

If a token's absence could put a cell at absurd by *seeding*, then the empty utterance `[]` would look
like a profound "ground" the system is built on. It isn't. An utterance that doesn't give both sides
is malformed input, and `articulate` throws — the same as any normal program rejecting bad input.
There is no foundational empty case.

```
code:  articulate([])  →  throws TypeError("malformed utterance — expected [left, right]")
```

## Why this is load-bearing

Because the state is measured, the two [cones](the-two-cones-and-the-void.md) can *bracket* a cell
honestly: `settle` measures the least its givens force, `brim` the most they allow, and the gap
between is real undetermination — not an artifact of where we stamped it. Seed the cell and that
bracket collapses to whatever you seeded; measure it and the bracket tells you something.

## See also

- reference: [the four states](../references/the-four-states.md) · [morphisms](../references/morphisms.md) (`posit`, `articulate`)
- explanation: [the two cones and the void](the-two-cones-and-the-void.md)
- tutorial: [watching absurd get reached](../tutorials/watching-absurd-get-reached.md)
