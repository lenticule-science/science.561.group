---
type: reference
authors: [Riehl, Emily; Verity, Dominic]
year: 2022
name: riehl-verity-2018
venue: "Cambridge Studies in Advanced Mathematics 194, Cambridge University Press"
---

## Full citation

E. Riehl and D. Verity. *Elements of ∞-Category Theory.* Cambridge Studies in Advanced Mathematics 194. Cambridge University Press, 2022. (Earlier preprint versions circulated 2018–2021.)

## Status

Pending direct access. Cited via the framework's borrowed structure.

## Annotation

Riehl–Verity's *Elements of ∞-Category Theory* is the modern systematization of 2-categorical and ∞-categorical machinery on which Movements II–IV of the relational calculus depend. The framework cites:

- **§7** for the lax-idempotence axiomatization of the closure operator $\Box$ (Movement II).
- **§8** for the biclosed structure of doctrines (Street §7) and the lax monoidal preservation law (Street §3 Cor.) — used in the Dynamic Residuation argument.
- **§3** for Flow preserving finite (co)limits — a property used in Movement III.

Riehl–Verity is paired with Street 1972 throughout the source material — the framework treats Street as the foundational source and Riehl–Verity as the modern reference. For machine-formalization-eligible theorems, Riehl–Verity is the more useful source because the proofs are stated in a form closer to what Lean's mathlib expects.

The relational calculus does not yet have a Lean library; if it gets one, the closure-2-monad lax-idempotence theorem (currently stated informally in Movement II and formally in [predication-categories'](../../../../../../../../../../library/theories/humanities/theories/math/theories/categories/theories/predication-categories/theorems/closure-2-monad-lax-idempotence.md) Lean module) would be the natural shared starting point.
