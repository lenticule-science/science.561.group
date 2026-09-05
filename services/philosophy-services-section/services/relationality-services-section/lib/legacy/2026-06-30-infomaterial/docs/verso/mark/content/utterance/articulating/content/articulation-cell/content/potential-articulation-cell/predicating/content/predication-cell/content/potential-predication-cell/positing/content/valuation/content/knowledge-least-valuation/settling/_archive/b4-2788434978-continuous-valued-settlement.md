---
name: continuous-valued-settlement
description: "Generalizes bilattice-valued settlements to continuous value categories — Lawvere quantales [0, ∞], continuous lattices, fuzzy logics, real-valued-with-pointwise-order presheaves. Closure operator and settling stages adapt to handle continuum structure on values. The substrate's first generalization beyond finite bilattices; natural setting for physics-flavored, probabilistic, fuzzy, or measurable applications."
kind: presheaf
symbol: "v_V"
valued-in: "V — a continuous value category (complete weighted lattice or Lawvere-quantale-like)"
generalizes: settlement
specializes-to-classical-when: "V is FOUR or a finite bilattice"
depends-on: [settlement, closure-2-monad, residuated-lattice, quantale-enriched-sheaf]
derives-from: docs/dev/scraps/continuous-valued-settling.md
---

# Continuous-valued settlement

A **continuous-valued settlement** generalizes the bilattice-valued settlement to a **continuous value category** `V` — Lawvere quantales `[0, ∞]`, continuous lattices, fuzzy logics, real-valued-with-pointwise-order presheaves.

The closure operator and settling stages adapt to handle the continuum structure on values. This is the substrate's first generalization of the value category beyond finite bilattices, and the natural setting for physics-flavored, probabilistic, fuzzy, or measurable applications.

## What changes when `V` is continuous

Three structural changes from the bilattice case:

**(1) Cell values live in `V`, not `L^⋈`.** The fiber-algebra becomes `A_p^V = V^{E × E}` — function from entity-pairs to `V`-elements.

**(2) Closure stays monotone but operates on `V`.** The closure operator `cl_p` becomes a `V`-enriched closure: monotone in `V`'s order, idempotent under `V`'s composition, inflationary. The standard examples (Fitting closure, description-logic TBox closure) all generalize cleanly.

**(3) Settling-continuity uses directed-joins in `V`.** At limit ordinals, `v_μ(p) = ⋁^V_{σ<μ} v_σ(p)` — directed-join in `V`. For Scott-continuous regimes, this requires `V` to have all directed-suprema; not all `V` do.

## Why `V` matters

Different choices of `V` produce different applications:

| `V` | Application |
|---|---|
| `FOUR` | classical bilattice predication (substrate standard) |
| `[0, 1]` (Lukasiewicz) | fuzzy logic |
| `[0, ∞]` (Lawvere quantale) | metric-space-valued; distance-aware predication |
| `Prob(X)` (probability measures) | Bayesian-style predication |
| `R^{op}_+` (non-negative reals, reverse order) | weighted/cost-valued settlement |
| MV-algebra | many-valued Łukasiewicz extension |

The substrate's machinery — closure-operator, settling-monotonicity, predication-fiber-algebra, settlement — works in each case with appropriate adaptations.

## Position

`finite-settlement-algebra/hacking/library/continuous-valued-settlement/`. Settling tier — generalization of the bilattice-valued settlement; specializes to bilattice-valued when `V = FOUR`.

## Derivation source

Adapted from `predication-categories/objects/continuous-valued-settling.md`, preserved at `docs/dev/scraps/`. Renamed per the four-object grammar.
