---
name: relation-to-predication-categories
type: question
status: open
explores: [generative-closure, ritm, dynamic-residuation, four-part-framework]
---

The relational calculus and [predication-categories](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/_index.md) are two presentations of overlapping content from opposite starting moves (act-algebra trace from Reflex vs. cell-based bilattice-valued predication). They reach overlapping structural territory — both derive complete Heyting algebras with modal closure and a cohesive geometry — but no formal translation between them is currently written.

See the [position vs predication-categories narrative](../teaching/explanations/position-vs-predication-categories.md) for the full prose; this question records what the open mathematical content is.

## The translation problem

Is there a faithful translation between:

- the *act-algebra trace* of the relational calculus (every act is a tree `(Witness Witnessed)` from the seed `()`); and
- the *predication settling orbit* of predication-categories (a transfinite chain of valuation updates on a predication fibration, evolving toward saturation)?

A *faithful* translation would establish that every act in $A_\infty$ corresponds to a step (or a finite sequence of steps) in some settling orbit, and conversely. It would license each side's theorems to be transported to the other.

## Three sub-questions

1. **Heyting → Bilattice.** Movement I produces a Heyting algebra; predication-categories' fiber algebras are bilattices (two orthogonal partial orders $\leq_t, \leq_k$). Can the second order $\leq_k$ be derived from the relational calculus, e.g. by introducing an *evidence-state* refinement of the field of recognition? See `position-vs-predication-categories` narrative for one candidate move.

2. **Closure 2-monad correspondence.** The relational calculus' nucleus $\Box$ has a 2-monadic lift to the 2-category of fibrations of the relational field. Is this lift *the same* as predication-categories' [closure 2-monad](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/morphisms/closure-2-monad.md)? Both are lax-idempotent (Kelly–Lack); the lax-idempotence statements look identical. Are they?

3. **Cohesive vs Priestley.** Movement IV's RITM is the Lawvere–Schreiber cohesive adjoint quadruple. Predication-categories carries the [bilattice ↔ d-frame correspondence](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/jung-rivieccio-duality.md) and [paired-Priestley spaces](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/objects/paired-priestley-space.md). Is RITM Priestley-dual to a structure in predication-categories?

## Why it matters

If the translation exists:

- The relational calculus inherits predication-categories' computational/cohomological machinery (settling cohomology, aperiodic-regime invariants, Lean library) for free.
- Predication-categories inherits the relational calculus' philosophical motivation (why a bilattice, why closure as 2-monad, why cohesion) and its self-grounding theorems.
- Both theories collapse into one with two presentations.

If the translation does not exist:

- The two theories cover overlapping but genuinely distinct content; each captures something the other misses, and the merger is more like a glued sum than a unified theory.

## Status

Open. The translation is the most important unfinished work in the relational calculus right now; without it, the calculus' formal-math layer has no machine-checkable form (the Lean library lives entirely in predication-categories).
